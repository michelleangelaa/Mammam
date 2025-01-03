////
////  AccountView.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 21/10/24.
////
//

//
//import SwiftUI
//import AuthenticationServices
//import SwiftData
//
//struct AccountView: View {
//    @Environment(\.colorScheme) var colorScheme
//    @Environment(\.modelContext) private var modelContext // Access SwiftData model context
//
//    var body: some View {
//        VStack {
//            SignInWithAppleButton(.continue, onRequest: { request in
//                request.requestedScopes = [.fullName, .email]
//            }, onCompletion: { result in
//                handleAppleSignIn(result: result)
//            })
//            .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
//            .frame(height: 50)
//            .padding(.horizontal)
//        }
//    }
//
//    private func handleAppleSignIn(result: Result<ASAuthorization, Error>) {
//        switch result {
//        case .success(let auth):
//            guard let appleCredential = auth.credential as? ASAuthorizationAppleIDCredential else { return }
//
//            let userId = appleCredential.user
//
//            // Retrieve or fallback to saved data in UserDefaults
//            let email = appleCredential.email ?? UserDefaults.standard.string(forKey: "\(userId)_email") ?? "Unavailable"
//            let firstName = appleCredential.fullName?.givenName ?? UserDefaults.standard.string(forKey: "\(userId)_firstName") ?? "Unavailable"
//            let lastName = appleCredential.fullName?.familyName ?? UserDefaults.standard.string(forKey: "\(userId)_lastName") ?? "Unavailable"
//
//            // Save to UserDefaults for future sign-ins
//            if appleCredential.email != nil {
//                UserDefaults.standard.setValue(email, forKey: "\(userId)_email")
//            }
//            if appleCredential.fullName?.givenName != nil {
//                UserDefaults.standard.setValue(firstName, forKey: "\(userId)_firstName")
//            }
//            if appleCredential.fullName?.familyName != nil {
//                UserDefaults.standard.setValue(lastName, forKey: "\(userId)_lastName")
//            }
//
//            // Check if the user already exists in the database
//            if let existingUser = fetchUser(by: userId) {
//                print("User already exists:", existingUser)
//
//                // Update existing user with new data if available
//                if email != "Unavailable" {
//                    existingUser.email = email
//                }
//                if firstName != "Unavailable" {
//                    existingUser.firstName = firstName
//                }
//                if lastName != "Unavailable" {
//                    existingUser.lastName = lastName
//                }
//                saveContext()
//
//            } else {
//                // Create and save a new user
//                let newUser = User(userId: userId, email: email, firstName: firstName, lastName: lastName)
//                modelContext.insert(newUser)
//                saveContext()
//                print("User saved successfully:", newUser)
//            }
//
//        case .failure(let error):
//            print("Sign-in failed with error:", error.localizedDescription)
//        }
//    }
//
//    private func fetchUser(by userId: String) -> User? {
//              let fetchRequest = FetchDescriptor<User>(
//                  predicate: #Predicate { user in
//                      user.userId == userId
//                  }
//              )
//              do {
//                  return try modelContext.fetch(fetchRequest).first
//              } catch {
//                  print("Error fetching user:", error.localizedDescription)
//                  return nil
//              }
//          }
//    private func saveContext() {
//        do {
//            try modelContext.save()
//        } catch {
//            print("Error saving context:", error.localizedDescription)
//        }
//    }
//}
//
//#Preview {
//    AccountView()
//}
