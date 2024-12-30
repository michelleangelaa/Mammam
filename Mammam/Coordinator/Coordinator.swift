//
//  Coordinator.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//
import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = .init()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullSceenCover?

    func push(page: AppPages) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func presentSheet(sheet: Sheet) {
        self.sheet = sheet
    }

    func presentFullScreenCover(fullScreenCover: FullSceenCover) {
        self.fullScreenCover = fullScreenCover
    }

    func dismissSheet() {
        sheet = nil
    }

    func dismissCover() {
        fullScreenCover = nil
    }

    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .main: MainView()
        case .logMeal: MealPlannerView()
        case .motivation: MotivationView(motivation: Motivation.sampleMotivation)
        case .mealFeedback: MealPlannerView()
        case .mealPlan: MealPlannerView()
        case .createMealPlan: SelectDateView()
        case .savedMenu: SavedMenuView()
        case .loadingView: GenerateMealLoadingView()
//        case .onBoarding : RegisterFormView()
        }
    }

    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .forgotPassword: MealPlanView()
        case .articleDetail (let article):
            NavigationStack{
                ArticleView(article : article)
            }
        case .mealDetail(let meal):
            if let ingredient = meal.ingredient {
                NavigationStack {
                    MealDetailView(meal: meal, ingredient: ingredient)
                }
            } else {
                Text("Ingredient not found.")
            }
        case .logMeal(let meal):
            NavigationStack {
                RateMealView(meal: meal)
            }
        case .mealFeedback(let meal): MealFeedbackView(meal: meal)
        }
    }

    @ViewBuilder
    func buildCover(cover: FullSceenCover) -> some View {
        switch cover {
        case .signUp: MealPlanView()
        }
    }

    func presentMealDetailSheet(with meal: Meal) {
        sheet = .mealDetail(meal: meal)
    }
    
    func presentRateMealSheet(with meal: Meal) {
        sheet = .logMeal(meal: meal)
    }

    func presentArticleDetailSheet(with article: Article) {
        sheet = .articleDetail(article: article)
    }
    
    func dismissSheetAndNavigateToHome() {
        dismissSheet()
        path = .init() // Reset the navigation stack
        push(page: .main)
    }
}
