//
//  AppPages.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//

import Foundation

enum AppPages: Hashable {
    case main
    case logMeal
    case motivation(motivation: Motivation)
    case mealPlan
    case createMealPlan
    case savedMenu
    case loadingView
    case reviewMealType(mealPlan: MealPlan)
    case updateProfile(baby: Baby)
    case foodRestrictions(baby: Baby)
    case account
    case registrationForm
    case splashScreen
    case successSignUp
}

enum Sheet: Identifiable {
    var id: String {
        switch self {
            case .article: return "article"
            case .mealDetail(let meal): return "mealDetail_\(meal.hashValue)"
            case .logMeal(let meal): return "logMeal_\(meal.hashValue)"
            case .mealFeedback(let meal): return "mealFeedback_\(meal.hashValue)"
            case .foodMenuDetail(let foodMenu): return "foodMenu"
            case .swapIngredient: return "swap"
        }
    }

    case article(article: Article)
    case mealDetail(meal: Meal)
    case logMeal(meal: Meal)
    case mealFeedback(meal: Meal)
    case foodMenuDetail(foodMenu: FoodMenu)
    case swapIngredient(meal: Meal)
}

enum FullSceenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }

    case loadingView
}
