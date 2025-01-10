//  AccountView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import AuthenticationServices
import SwiftData
import SwiftUI

struct AccountView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel: AccountViewModel
    @EnvironmentObject private var coordinator: Coordinator

    init() {
        _viewModel = StateObject(wrappedValue: AccountViewModel())
    }

    var body: some View {
        Group {
            if !viewModel.isLoggedInState {
                loginContent
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onChange(of: viewModel.isLoggedInState) { _, newValue in
            if newValue {
                viewModel.handleSignInNavigation(using: coordinator)
            }
        }
        .navigationBarBackButtonHidden()
    }

    private var loginContent: some View {
        VStack {
            ZStack {
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
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.top, 40)

            Spacer()

            SignInWithAppleButton(.continue, onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            }, onCompletion: { result in
                viewModel.handleAppleSignIn(result: result, modelContext: modelContext)
            })
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
}
