//
//  MealPlan.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

@Model
class MealPlan {
    var startDate: Date
    var endDate: Date
    @Relationship(deleteRule: .cascade)
    var meals: [Meal]?
    
    @Relationship(inverse: \Baby.mealPlans)
    var baby: Baby?

    init(startDate: Date, endDate: Date, meals: [Meal]? = nil, baby: Baby? = nil) {
        self.startDate = startDate
        self.endDate = endDate
        self.meals = meals
        self.baby = baby
    }
}
