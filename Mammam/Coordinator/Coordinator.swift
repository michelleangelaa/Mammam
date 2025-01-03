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
    @Published var selectedTab: MainView.Tab? // Add this to track selected tab

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
        case .motivation: MotivationView()
        case .mealPlan: MealPlannerView()
        case .createMealPlan: SelectDateView()
        case .savedMenu: SavedMenuView()
        case .loadingView: GenerateMealLoadingView()
//        case .onBoarding : RegisterFormView()
        case .reviewMealType(let mealPlan):
            ReviewMealTypeView(mealPlan: mealPlan) // Navigate to ReviewMealTypeView
//        case .account: AccountView()
        case .updateProfile(let baby): UpdateBabyProfileView(baby: baby)
        case .foodRestrictions: UpdateFoodRestrictionView()
//        case .foodRestrictions(let baby): UpdateFoodRestrictionView(baby: baby)
        case .registrationForm: RegisterFormView()
        }
    }

    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {    
        switch sheet {
        case .forgotPassword: MealPlanView()
        case .article: ArticleView()
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
        case .loadingView: GenerateMealLoadingView()
        }
    }

    func presentMealDetailSheet(with meal: Meal) {
        sheet = .mealDetail(meal: meal)
    }

//    func presentMealDetailAndLogMeal(with meal: Meal) {
//        // Present the MealDetailView first
//        sheet = .mealDetail(meal: meal)
//
//        // After dismissing MealDetailView, navigate to RateMealView
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.sheet = .logMeal(meal: meal)
//        }
//    }

    func presentRateMealSheet(with meal: Meal) {
        sheet = .logMeal(meal: meal)
    }

    func dismissSheetAndNavigateToHome() {
        dismissSheet()
        path = .init() // Reset the navigation stack
        push(page: .main)
    }
}
