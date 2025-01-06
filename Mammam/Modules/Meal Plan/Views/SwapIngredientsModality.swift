//
//  SwapIngredientsModality.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/01/25.
//

import SwiftData
import SwiftUI

struct SwapIngredientsModality: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    var currentMeal: Meal
    @State private var selectedIngredient: Ingredient? // Track selected ingredient
    @State private var availableIngredients: [Ingredient] = [] // Limit to 5 unique ingredients

    var body: some View {
        VStack(spacing: 20) {
            Text("Swap ingredients")
                .font(.title2)
                .fontWeight(.bold)

            // Ingredient Scroll View
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(availableIngredients, id: \.self) { ingredient in
                        VStack {
                            Image(ingredient.image ?? "fork.knife") // Ensure `image` is set in the model
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedIngredient == ingredient ? Color.pink : Color.clear, lineWidth: 3)
                                )
                                .onTapGesture {
                                    selectedIngredient = ingredient
                                }

                            Text(ingredient.name)
                                .font(.caption)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()

            // Continue Button
            Button(action: {
                if let ingredient = selectedIngredient {
                    updateMeal(with: ingredient)
                    dismiss()
                }
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedIngredient != nil ? Color.pink : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(selectedIngredient == nil) // Disable if no ingredient is selected
            .padding(.horizontal)
        }
        .padding()
        .onAppear {
            loadAvailableIngredients()
        }
        .presentationDetents([.fraction(0.40)]) // Add the detents here
    }

    // MARK: - Helper Functions

    private func loadAvailableIngredients() {
        let allIngredients = Ingredient.getExistingIngredients(context: context)
        availableIngredients = Array(Set(allIngredients).prefix(5)) // Limit to 5 unique ingredients
    }

    private func updateMeal(with ingredient: Ingredient) {
        currentMeal.ingredient = ingredient
        do {
            try context.save() // Save changes to the database
            print("Meal updated with new ingredient: \(ingredient.name)")
        } catch {
            print("Failed to update meal ingredient: \(error)")
        }
    }
}

//#Preview {
//    SwapIngredientsModality()
//}
