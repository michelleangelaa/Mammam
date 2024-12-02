//
//  RateMealView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import SwiftUI

struct RateMealView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Text("rate ur mealll")
        Button {
            coordinator.dismissSheet()
        } label: {
            Text("back")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RateMealView()
}
