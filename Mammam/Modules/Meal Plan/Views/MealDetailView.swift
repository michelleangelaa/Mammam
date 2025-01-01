//
//  MealDetailView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftUI

struct MealDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator

    @ObservedObject var meal: Meal
    var ingredient: Ingredient
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Ingredient Header
                Text(ingredient.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                // Ingredient Image
                if let ingredientImage = ingredient.image {
                    Image(ingredientImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                }
                
                // Nutrients Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nutrients:")
                        .font(.headline)
                    
                    if let nutrients = ingredient.nutrients {
                        ForEach(nutrients, id: \.self) { nutrient in
                            Text(nutrient.name)
                                .foregroundColor(.secondary)
                        }
                    } else {
                        Text("No nutrients available.")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Available Meals Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Available Meals")
                        .font(.headline)
                    
                    if let menus = ingredient.menus {
                        ForEach(menus, id: \.self) { menu in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(menu.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(menu.name)
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                        
                                        if let allergens = menu.allergens, !allergens.isEmpty {
                                            Text("Allergens: " + allergens.map { $0.name }.joined(separator: ", "))
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                            Divider()
                        }
                    } else {
                        Text("No meals available")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                Button(action: {
                    coordinator.presentRateMealSheet(with: meal)
                }) {
                    Text("Review Meal")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.rose.rose500)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

// #Preview {
//    NavigationStack {
//        if let eggIngredient = myIngredients.first(where: { $0.name == "Egg" }) {
//            MealDetailView(ingredient: eggIngredient)
//        }
//    }
// }
