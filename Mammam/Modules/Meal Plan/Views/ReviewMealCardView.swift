//
//  ReviewMealCardView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 17/02/25.
//

import SwiftUI

struct ReviewMealCardView: View {
    var meal: Meal
    var dayRange: String
    var onReplace: (Ingredient) -> Void
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        HStack(spacing: 16) {
            Image(meal.ingredient?.image ?? "fork.knife") // Placeholder for the meal image
                .resizable()
                .frame(width: 70, height: 70)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(dayRange)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.rose.rose600)
                    )
                Text(meal.ingredient?.name ?? "Unknown")
                    .font(.headline).fontWeight(.semibold)
                Text("\(meal.ingredient?.menus?.count ?? 0) menu variant(s)")
                    .font(.footnote)
            }
            Spacer()

            // Replace Button
            Button(action: {
                if let currentIngredient = meal.ingredient {
                    // Filter out the current ingredient
                    let availableIngredients = Ingredient.getExistingIngredients(context: context)
                        .filter { $0.name != currentIngredient.name }

                    if let newIngredient = availableIngredients.randomElement() {
                        // Just update the reference, don't create new data
                        onReplace(newIngredient)
                    }
                }
            }) {
                Image(systemName: "arrow.clockwise")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray6))
        )
        .onTapGesture {
            coordinator.presentSwapIngredientsSheet(for: meal) // Trigger the half-sheet
        }
    }
}


//
//#Preview {
//    ReviewMealCardView()
//}
