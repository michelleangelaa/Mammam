////
////  ReviewMealTypeViewModel.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 30/01/25.
////
//
//import Foundation
//import SwiftData
//
//
//@MainActor
//class ReviewMealTypeViewModel: ObservableObject {
//    @Published var currentMealTypeIndex: Int = 0
//    @Published var meals: [Meal] = []
//    @Published var isLastMealType: Bool = false
//    
//    let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
//    
//    private let context: ModelContext
//    private let mealPlan: MealPlan
//    
//    func updateContext(_ newContext: ModelContext) {
//            self.context = newContext
//        }
//    
//    init(context: ModelContext, mealPlan: MealPlan) {
//        self.context = context
//        self.mealPlan = mealPlan
//    }
//    
//    func loadMealsForCurrentMealType() {
//        let currentMealType = mealTypes[currentMealTypeIndex]
//        guard let mealPlanMeals = mealPlan.meals else { return }
//        
//        // Create a new array instead of modifying the existing one
//        let filteredMeals = mealPlanMeals
//            .filter { $0.type == currentMealType }
//            .sorted { $0.timeGiven < $1.timeGiven }
//        
//        DispatchQueue.main.async {
//            self.meals = filteredMeals
//        }
//    }
//    
//    func updateMealIngredient(_ meal: Meal, newIngredient: Ingredient) {
//        // Make sure both objects are from the same context
//        guard let contextMeal = context.model(for: meal.persistentModelID) as? Meal,
//              let contextIngredient = context.model(for: newIngredient.persistentModelID) as? Ingredient
//        else {
//            print("Failed to get objects from context")
//            return
//        }
//        
//        contextMeal.ingredient = contextIngredient
//        
//        do {
//            try context.save()
//            loadMealsForCurrentMealType()
//        } catch {
//            print("Failed to update meal ingredient: \(error)")
//        }
//    }
//    
//    func moveToNextMealType() -> Bool {
//        if currentMealTypeIndex < mealTypes.count - 1 {
//            currentMealTypeIndex += 1
//            return false
//        } else {
//            isLastMealType = true
//            return true
//        }
//    }
//}
