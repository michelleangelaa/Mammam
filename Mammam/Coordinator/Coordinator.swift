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
    @Published var selectedTab: MainView.Tab?

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
        case .main: MainView().environmentObject(self)
        case .logMeal: MealPlannerView()
        case .motivation (let motivation):
            MotivationView(motivation: motivation)
        case .mealPlan: MealPlannerView()
        case .createMealPlan: SelectDateView()
        case .savedMenu: SavedMenuView()
        case .loadingView: GenerateMealLoadingView()
        case .reviewMealType(let mealPlan):
            ReviewMealTypeView(mealPlan: mealPlan)
        case .account: AccountView()
        case .updateProfile(let baby): UpdateBabyProfileView(baby: baby)
        case .foodRestrictions: UpdateFoodRestrictionView()
        case .registrationForm: RegisterFormView()
        case .splashScreen: SplashScreenView()
        case .successSignUp: AccountSuccessView()
        }
    }

    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .article (let article):
            NavigationStack {
                ArticleView(article: article)
            }
        case .foodMenuDetail(let foodMenu):
            NavigationStack {
                FoodMenuDetailView(foodMenu: foodMenu)
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
        case .swapIngredient(let meal): SwapIngredientsModality(currentMeal: meal)
        }
        
    }

    @ViewBuilder
    func buildCover(cover: FullSceenCover) -> some View {
        switch cover {
        case .loadingView: GenerateMealLoadingView()
        }
    }

    func presentMealDetailSheet(with meal: Meal) {
        sheet = .mealDetail(meal: meal)
    }

    func presentSwapIngredientsSheet(for meal: Meal) {
        sheet = .swapIngredient(meal: meal)

    }

    func presentRateMealSheet(with meal: Meal) {
        sheet = .logMeal(meal: meal)
    }
    
    func presentDetailArticleSheet(with article: Article) {
        sheet = .article(article: article)
    }

    func dismissSheetAndNavigateToHome() {
        dismissSheet()
        path = .init()
        push(page: .main)
    }
}
