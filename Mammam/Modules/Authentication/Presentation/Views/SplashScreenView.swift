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
        ZStack {
            Image("BG_SplashScreen")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 86)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if isLoggedIn {
                    coordinator.push(page: .main)
                } else {
                    coordinator.push(page: .account)
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
