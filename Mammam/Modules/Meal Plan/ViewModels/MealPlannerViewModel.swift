//
//  MealPlannerViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 30/01/25.
//

import Foundation
import SwiftUI
import SwiftData

class MealPlannerViewModel: ObservableObject {
    @Published private(set) var groupedMealsByDate: [(date: Date, meals: [Meal])] = []
    
    func updatePlans(_ plans: [MealPlan]) {
        let allMeals = plans.flatMap { $0.meals ?? [] }
        let groupedMeals = Dictionary(grouping: allMeals) { meal in
            Calendar.current.startOfDay(for: meal.timeGiven)
        }
        let sortedDates = groupedMeals.keys.sorted()
        
        groupedMealsByDate = sortedDates.compactMap { date in
            if let meals = groupedMeals[date] {
                return (date: date, meals: meals)
            }
            return nil
        }
    }
    
    func mealTypeOrder(_ type: String) -> Int {
        switch type {
        case "Breakfast": return 0
        case "Morning Snack": return 1
        case "Lunch": return 2
        case "Evening Snack": return 3
        case "Dinner": return 4
        default: return 5
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM"
        return formatter.string(from: date)
    }
}
