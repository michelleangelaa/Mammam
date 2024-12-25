//
//  AccountView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import AuthenticationServices
import SwiftUI

struct AccountView: View {
    @AppStorage("email") var email: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        VStack {
            SignInWithAppleButton(.continue) { request in
                request.requestedScopes = [.email, .fullName]
            } onCompletion: { result in
                switch result {
                case .success(let auth):
                    switch auth.credential {
                    case let credential as ASAuthorizationAppleIDCredential:
                        let userId = credential.user
                        
                        let email = credential.email
                        
                        self.email = email ?? ""
                        self.userId = userId
                    default:
                        break
                    }
                case .failure(let error):
                    print(error)
                }
            }
            .frame(height: 50)
            .padding()
            .cornerRadius(8)
        }
    }
}

#Preview {
    AccountView()
}
