//
//  DisplayAllergicWatch.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 17/02/25.
//

import SwiftUI

struct DisplayAllergicWatch: View {
    var meals: [Meal]
    var coordinator: Coordinator

    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
            Text("Allergic Watch").font(.body)
        }
        .foregroundStyle(Color.red)

        LazyVStack(spacing: 16) {
            ForEach(meals.filter { $0.isAllergic }, id: \.self) { meal in
                Button(action: {
                    coordinator.presentSheet(sheet: .mealFeedback(meal: meal))
                }) {
                    HistoryMealCardView(meal: meal)
                }
            }
        }
    }
}
