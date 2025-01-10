//
//  AccountViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 10/01/25.
//

import Foundation
import SwiftData
import AuthenticationServices

class AccountViewModel: ObservableObject {
    @Published var isFirstTimeSignIn: Bool = false
    @Published var isLoggedInState: Bool = false
    @Published var currentUser: User?
    
    var isSignIn: Bool {
        currentUser?.userId.isEmpty == false
    }
    
    func handleAppleSignIn(result: Result<ASAuthorization, Error>, modelContext: ModelContext) {
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
            
            if let existingUser = fetchUser(by: userId, in: modelContext) {
                updateUser(existingUser, email: email, firstName: firstName, lastName: lastName, in: modelContext)
                isFirstTimeSignIn = false
            } else {
                createUser(userId: userId, email: email, firstName: firstName, lastName: lastName, in: modelContext)
                isFirstTimeSignIn = true
            }
            
            isLoggedInState = true
            
        case .failure(let error):
            print("Sign-in failed with error:", error.localizedDescription)
        }
    }
    
    private func fetchUser(by userId: String, in modelContext: ModelContext) -> User? {
        let fetchRequest = FetchDescriptor<User>(
            predicate: #Predicate { $0.userId == userId }
        )
        do {
            return try modelContext.fetch(fetchRequest).first
        } catch {
            print("Error fetching user:", error.localizedDescription)
            return nil
        }
    }
    
    private func updateUser(_ user: User, email: String, firstName: String, lastName: String, in modelContext: ModelContext) {
        if email != "Unavailable" { user.email = email }
        if firstName != "Unavailable" { user.firstName = firstName }
        if lastName != "Unavailable" { user.lastName = lastName }
        currentUser = user
        saveContext(modelContext)
    }
    
    private func createUser(userId: String, email: String, firstName: String, lastName: String, in modelContext: ModelContext) {
        let newUser = User(userId: userId, email: email, firstName: firstName, lastName: lastName)
        modelContext.insert(newUser)
        currentUser = newUser
        saveContext(modelContext)
    }
    
    private func saveContext(_ modelContext: ModelContext) {
        do {
            try modelContext.save()
        } catch {
            print("Error saving context:", error.localizedDescription)
        }
    }
    
    func handleSignInNavigation(using coordinator: Coordinator) {
        if isFirstTimeSignIn {
            coordinator.push(page: .successSignUp)
        } else {
            coordinator.push(page: .main)
        }
    }
}
