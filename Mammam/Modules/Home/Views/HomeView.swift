//
//  HomePageView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Text("This is home view")
        
        CustomLargeButtonComponent(state: .enabled, text: "mau ke profile page") {
            coordinator.push(page: .login)
        }
        Button {
            coordinator.push(page: .login)
        } label: {
            Text("go to login but profile")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
        .environmentObject(Coordinator())
}

