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
    case mealFeedback
    case motivation
    case mealPlan
    case createMealPlan
    case savedMenu
    case loadingView
    case updateProfile(baby: Baby)
//    case onBoarding
}

enum Sheet: Identifiable {
    var id: String {
        switch self {
            case .forgotPassword: return "forgotPassword"
            case .articleDetail: return "article"
            case .mealDetail(let meal): return "mealDetail_\(meal.hashValue)"
            case .logMeal(let meal): return "logMeal_\(meal.hashValue)"
            case .mealFeedback(let meal): return "mealFeedback_\(meal.hashValue)"
        }
    }

    case forgotPassword
    case mealDetail(meal: Meal)
    case logMeal(meal: Meal)
    case mealFeedback(meal: Meal)
    case articleDetail(article: Article)
}

enum FullSceenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }

    case signUp
}
