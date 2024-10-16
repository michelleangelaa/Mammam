//
//  MealPlanView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Text("this is meal plan view")
        Button {
            coordinator.presentSheet(sheet: .rateMeal)
        } label: {
            Text("forgot password")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MealPlanView()
}
