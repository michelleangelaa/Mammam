//
//  ProfileView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        Text("This is profile page")
        Button {
            coordinator.presentSheet(sheet: .forgotPassword)
        } label: {
            Text("forgot password")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

#Preview {
    ProfileView()
}
