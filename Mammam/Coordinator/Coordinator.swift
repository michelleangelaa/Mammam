//
//  Coordinator.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//
import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
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
        self.sheet = nil
    }
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .main: HomeView()
        case .login: ProfileView()
        case .logMeal: MealPlannerView()
        case .mealFeedback: MealFeedbackView()


        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .forgotPassword: MealPlanView()
        case .rateMeal: RateMealView()
        case .mealDetail: MealDetailView()

        }
    }
    
    @ViewBuilder
    func buildCover(cover: FullSceenCover) -> some View {
        switch cover {
        case .signUp: MealPlanView()

        }
    }
    
}
