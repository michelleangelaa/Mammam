//  AccountView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import AuthenticationServices
import SwiftData
import SwiftUI

struct AccountView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isFirstTimeSignIn: Bool = false
    @State private var isLoggedInState: Bool = false
    
    @Query private var users: [User]
    @State private var currentUser: User?
    
    private var isSignIn: Bool {
        currentUser?.userId.isEmpty == false
    }
    
    var body: some View {
        // Only show login content if not logged in
        Group {
            if !isLoggedInState {
                loginContent
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onChange(of: isLoggedInState) { _, newValue in
            if newValue {
                // Handle navigation based on sign-in status
                DispatchQueue.main.async {
                    if isFirstTimeSignIn {
                        coordinator.push(page: .successSignUp)
                    } else {
                        coordinator.push(page: .main)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private var loginContent: some View {
        VStack {
            // Top Section with Background and Logo
            ZStack {
                // Gradient Background
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.89, green: 0.08, blue: 0.31), location: 0.11),
                        Gradient.Stop(color: Color(red: 0.92, green: 0.49, blue: 0.27), location: 0.91),
                    ],
                    startPoint: UnitPoint(x: 0.11, y: 0.95),
                    endPoint: UnitPoint(x: 0.94, y: 0.19)
                )
                .frame(width: 450, height: 450)
                .clipShape(
                    RoundedRectangle(cornerRadius: 900, style: .continuous)
                )
                .edgesIgnoringSafeArea(.top)
                .padding(.top, -100)
                
                Image("Logo_White")
                    .resizable()
                    .frame(width: 272, height: 116)
                    .scaledToFit()
            }
            
            VStack(alignment: .center, spacing: 8) {
                Text("Welcome to Mammam")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Cherish Every Bite")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
                
                Text("Say no more to picky eating by introducing a variety of ingredients")
                    .font(.callout)
                    .foregroundColor(.primary)
                    .padding()
                    .multilineTextAlignment(.center) // Ensure the text aligns to the center for multiline
                    .frame(maxWidth: .infinity, alignment: .center) // Center-align within the VStack
            }
            .padding(.top, 40)
            
            Spacer()
            
            SignInWithAppleButton(.continue, onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            }, onCompletion: { result in
                handleAppleSignIn(result: result)
            })
            .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
    
    private func handleAppleSignIn(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            guard let appleCredential = auth.credential as? ASAuthorizationAppleIDCredential else { return }
            
            let userId = appleCredential.user
            let email = appleCredential.email ?? UserDefaults.standard.string(forKey: "\(userId)_email") ?? "Unavailable"
            let firstName = appleCredential.fullName?.givenName ?? UserDefaults.standard.string(forKey: "\(userId)_firstName") ?? "Unavailable"
            let lastName = appleCredential.fullName?.familyName ?? UserDefaults.standard.string(forKey: "\(userId)_lastName") ?? "Unavailable"
            
            // Save to UserDefaults
            if appleCredential.email != nil {
                UserDefaults.standard.setValue(email, forKey: "\(userId)_email")
            }
            if appleCredential.fullName?.givenName != nil {
                UserDefaults.standard.setValue(firstName, forKey: "\(userId)_firstName")
            }
            if appleCredential.fullName?.familyName != nil {
                UserDefaults.standard.setValue(lastName, forKey: "\(userId)_lastName")
            }
            
            if let existingUser = fetchUser(by: userId) {
                if email != "Unavailable" {
                    existingUser.email = email
                }
                if firstName != "Unavailable" {
                    existingUser.firstName = firstName
                }
                if lastName != "Unavailable" {
                    existingUser.lastName = lastName
                }
                currentUser = existingUser
                saveContext()
                isFirstTimeSignIn = false
            } else {
                let newUser = User(userId: userId, email: email, firstName: firstName, lastName: lastName)
                modelContext.insert(newUser)
                currentUser = newUser
                saveContext()
                isFirstTimeSignIn = true
            }
            
            // Set logged in state after all processing is complete
            isLoggedInState = true
            
        case .failure(let error):
            print("Sign-in failed with error:", error.localizedDescription)
        }
    }
    
    private func fetchUser(by userId: String) -> User? {
        let fetchRequest = FetchDescriptor<User>(
            predicate: #Predicate { user in
                user.userId == userId
            }
        )
        do {
            return try modelContext.fetch(fetchRequest).first
        } catch {
            print("Error fetching user:", error.localizedDescription)
            return nil
        }
    }
    
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Error saving context:", error.localizedDescription)
        }
    }
}
