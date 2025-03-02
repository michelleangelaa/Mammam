//
//  MealDetailViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 01/02/25.
//

import Foundation
import SwiftUI


class MealDetailViewModel: ObservableObject {
    @Published var ingredient: Ingredient
    @Published var meal: Meal

    init(meal: Meal, ingredient: Ingredient) {
        self.meal = meal
        self.ingredient = ingredient
    }

    var ingredientImage: String? {
        ingredient.image
    }

    var ingredientName: String {
        ingredient.name
    }

    var nutrients: [Nutrient] {
        ingredient.nutrients ?? []
    }

    var menus: [FoodMenu] {
        ingredient.menus ?? []
    }

    func hasNutrients() -> Bool {
        !nutrients.isEmpty
    }

    func hasMenus() -> Bool {
        !menus.isEmpty
    }

    func reviewMeal(coordinator: Coordinator) {
        coordinator.presentRateMealSheet(with: meal)
    }

    func showFoodMenuDetail(for menu: FoodMenu, coordinator: Coordinator) {
        coordinator.presentSheet(sheet: .foodMenuDetail(foodMenu: menu))
    }

    func closeView(coordinator: Coordinator) {
        coordinator.dismissSheet()
    }
}

