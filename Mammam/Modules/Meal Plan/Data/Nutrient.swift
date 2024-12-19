//
//  Nutrition.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

@Model
class Nutrient {
    var name: String
    var ingredients: [Ingredient]?
    
    init(name: String, ingredients: [Ingredient]? = nil) {
        self.name = name
        self.ingredients = ingredients
    }
}
