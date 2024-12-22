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

    init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
        self.meals = [] // Initialize empty array
    }
}
