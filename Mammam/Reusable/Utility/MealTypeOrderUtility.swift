//
//  MealTypeOrderUtility.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 01/01/25.
//

import Foundation

struct MealTypeOrderUtility {
    static func mealTypeOrder(_ type: String) -> Int {
        switch type {
        case "Breakfast": return 0
        case "Morning Snack": return 1
        case "Lunch": return 2
        case "Evening Snack": return 3
        case "Dinner": return 4
        default: return 5
        }
    }
}
