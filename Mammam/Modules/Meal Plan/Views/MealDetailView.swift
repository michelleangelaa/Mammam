//
//  MealDetailView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftUI

struct MealDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel: MealDetailViewModel

    init(meal: Meal, ingredient: Ingredient) {
        _viewModel = StateObject(wrappedValue: MealDetailViewModel(meal: meal, ingredient: ingredient))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Ingredient Name
                Text(viewModel.ingredientName)
                    .font(.title2)
                    .fontWeight(.bold)

                // Ingredient Image
                if let image = viewModel.ingredientImage {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                }

                // Nutrients Section
                VStack(alignment: .leading, spacing: 12) {
                    if viewModel.hasNutrients() {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nutrients")
                                .font(.body)
                                .fontWeight(.bold)
                            HStack {
                                ForEach(viewModel.nutrients, id: \.self) { nutrient in
                                    Text("\(nutrient.name)")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .foregroundStyle(Color.black)
                                        .font(.body)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.bluegray.bluegray100)
                                                .stroke(Color.bluegray.bluegray400)
                                        )
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                // Available Meals Section
                VStack(alignment: .leading, spacing: 12) {
                    if viewModel.hasMenus() {
                        Text("Variate with these menu")
                            .font(.body)
                            .fontWeight(.bold)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(viewModel.menus) { food in
                                    FoodMenuCardComponent(foodMenu: food)
                                        .frame(width: 150)
                                        .onTapGesture {
                                            viewModel.showFoodMenuDetail(for: food, coordinator: coordinator)
                                        }
                                }
                            }
                        }
                    } else {
                        Text("No meals available")
                            .foregroundColor(.secondary)
                    }
                }

                Spacer(minLength: 40)

                // Review Meal Button
                Button(action: {
                    viewModel.reviewMeal(coordinator: coordinator)
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        viewModel.closeView(coordinator: coordinator)
                    }
                }
            }
        }
    }
}
