//
//  ReviewMealTypeViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 19/12/24.
//

import SwiftData
import SwiftUI

class ReviewMealTypeViewModel: ObservableObject {
    @Published var currentMealTypeIndex: Int = 0
    @Published var meals: [Meal] = []
    @Published var isLastMealType: Bool = false

    private let mealPlan: MealPlan
    private let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
    
    @Environment(\.modelContext) private var context // Fetch context from environment

    init(mealPlan: MealPlan) {
        self.mealPlan = mealPlan
        loadMealsForCurrentMealType()
    }
    
    var currentMealType: String {
        mealTypes[currentMealTypeIndex]
    }
    
    var progressIndicator: (total: Int, current: Int) {
        (mealTypes.count, currentMealTypeIndex + 1)
    }
    
    func loadMealsForCurrentMealType() {
        guard let mealPlanMeals = mealPlan.meals else { return }

        meals = mealPlanMeals
            .filter { $0.type == currentMealType }
            .filter { meal in
                // Ensure filtering is applied
                meal.ingredient?.isSafeToShow ?? true
            }
            .sorted { $0.timeGiven < $1.timeGiven }

        print("Loaded \(meals.count) meals for \(currentMealType)")
    }
    
    func updateMealIngredient(_ meal: Meal, newIngredient: Ingredient) {
        meal.ingredient = newIngredient
        do {
            try context.save()
            print("Updated ingredient for \(meal.type)")
        } catch {
            print("Failed to update meal ingredient: \(error)")
        }
    }
    
    func nextStep(coordinator: Coordinator) {
        if currentMealTypeIndex < mealTypes.count - 1 {
            currentMealTypeIndex += 1
            loadMealsForCurrentMealType()
        } else {
            isLastMealType = true
            coordinator.presentFullScreenCover(fullScreenCover: .loadingView)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                coordinator.dismissCover()
                coordinator.selectedTab = .mealPlanner
                coordinator.push(page: .main)
            }
        }
    }
}
