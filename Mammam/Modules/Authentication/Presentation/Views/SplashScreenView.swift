//
//  SplashScreenView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 03/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    var body: some View {
        VStack {
            Text("This is the splash screen")
                .font(.largeTitle)
                .padding()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if isLoggedIn {
                    coordinator.push(page: .main) // Go to the main screen
                } else {
                    coordinator.push(page: .account) // Go to the account (sign-in) screen
                }
            }
        }
    }
}


#Preview {
    SplashScreenView()
}
