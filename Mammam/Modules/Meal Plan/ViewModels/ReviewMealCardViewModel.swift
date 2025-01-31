////
////  ReviewMealCardViewModel.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 30/01/25.
////
//import SwiftData
//import Foundation
//
//@MainActor
//class ReviewMealCardViewModel: ObservableObject {
//    private let context: ModelContext
//    let meal: Meal
//    let onReplace: (Ingredient) -> Void
//    
//    init(context: ModelContext, meal: Meal, onReplace: @escaping (Ingredient) -> Void) {
//        self.context = context
//        self.meal = meal
//        self.onReplace = onReplace
//    }
//    
//    func replaceIngredient() {
//        guard let currentIngredient = meal.ingredient else { return }
//        
//        // Get ingredients from the same context
//        let fetchDescriptor = FetchDescriptor<Ingredient>()
//        guard let availableIngredients = try? context.fetch(fetchDescriptor) else { return }
//        
//        let filteredIngredients = availableIngredients.filter { $0.persistentModelID != currentIngredient.persistentModelID }
//        
//        if let newIngredient = filteredIngredients.randomElement() {
//            onReplace(newIngredient)
//        }
//    }
//}
