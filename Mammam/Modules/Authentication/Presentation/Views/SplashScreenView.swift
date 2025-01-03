//
//  SplashScreenView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 03/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        Text("this is splash screen")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    coordinator.push(page: .account)
                }
            }
    }
}

#Preview {
    SplashScreenView()
}
