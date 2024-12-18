//
//  Meal.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 03/12/24.
//

import Foundation
import SwiftData

@Model
class Meal{
    var ingredient: String
    var type: String
    var timeGiven: Date
    var timeEnded: Date
    var servingUnit: String
    var servingQty: Double
    var consumedQty: Double
    var allergic: Bool
    var notes: String
    
    init(ingredient: String, type: String, timeGiven: Date, timeEnded: Date, servingUnit: String, servingQty: Double, consumedQty: Double, allergic: Bool, notes: String) {
        self.ingredient = ingredient
        self.type = type
        self.timeGiven = timeGiven
        self.timeEnded = timeEnded
        self.servingUnit = servingUnit
        self.servingQty = servingQty
        self.consumedQty = consumedQty
        self.allergic = allergic
        self.notes = notes
    }
}
