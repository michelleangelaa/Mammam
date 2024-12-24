//
//  Meal.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 03/12/24.
//

import Foundation
import SwiftData

@Model
class Meal: ObservableObject {
    @Relationship(inverse: \MealPlan.meals)
    var mealPlan: MealPlan?
    @Relationship
    var ingredient: Ingredient?
    var type: String
    var timeGiven: Date
    var timeEnded: Date
    var servingUnit: String
    var servingQty: Double
    var consumedQty: Double
    var isAllergic: Bool
    var isLogged: Bool
    var notes: String

    init(ingredient: Ingredient? = nil, mealPlan: MealPlan? = nil, type: String, timeGiven: Date, timeEnded: Date, servingUnit: String, servingQty: Double, consumedQty: Double, isAllergic: Bool, isLogged: Bool, notes: String) {
        self.mealPlan = mealPlan
        self.ingredient = ingredient
        self.type = type
        self.timeGiven = timeGiven
        self.timeEnded = timeEnded
        self.servingUnit = servingUnit
        self.servingQty = servingQty
        self.consumedQty = consumedQty
        self.isAllergic = isAllergic
        self.isLogged = isLogged
        self.notes = notes
    }

    var durationInMinutes: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: timeGiven, to: timeEnded)
        return components.minute ?? 0
    }

    var timeRange: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a" // Example: 8:00 PM

        let startTime = formatter.string(from: timeGiven)
        let endTime = formatter.string(from: timeEnded)

        return "\(startTime) - \(endTime)"
    }

    var totalConsumption: String {
        return "\(consumedQty)/\(servingQty) \(servingUnit)"
    }
}
