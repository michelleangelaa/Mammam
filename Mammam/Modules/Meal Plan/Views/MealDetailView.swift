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
                Text(ingredient.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                if let ingredientImage = ingredient.image {
                    Image(ingredientImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nutrients")
                        .font(.body)
                    
                    if let nutrients = ingredient.nutrients {
                        ForEach(nutrients, id: \.self) { nutrient in
                            Text(nutrient.name)
                                .foregroundColor(.secondary)
                        }
                    } else {
                        Text("No nutrients available.")
                            .foregroundColor(.secondary)
                    }
                    
                    if let nutrients = ingredient.nutrients, !nutrients.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nutrients")
                                .font(.body)
                            HStack {
                                ForEach(nutrients, id: \.self) { nutrient in
                                    Text("\(nutrient.name)")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .font(.body)
                                        .foregroundStyle(Color.red)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.rose.rose100)
                                                .stroke(Color.red)
                                        )
                                }
                            }
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Available Meals Section
                VStack(alignment: .leading, spacing: 12) {
                    
                    
                    if let menus = ingredient.menus, !menus.isEmpty {
                        Text("Available Meals")
                            .font(.headline)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(menus) { food in
                                    FoodMenuCardComponent(foodMenu: food)
                                        .frame(width: 150)
                                        .onTapGesture {
                                            coordinator.presentSheet(sheet: .foodMenuDetail(foodMenu: food))
                                        }
                                }
                            }
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
//            MealDetailView(meal: Meal, ingredient: eggIngredient)
//        }
//    }
// }
