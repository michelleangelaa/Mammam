//
//  Nutrient.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

@Model
class Nutrient {
    var name: String
    var nutrientCount: Int
    
    var ingredients: [Ingredient]?
    
    init(name: String, nutrientCount: Int, ingredients: [Ingredient]? = nil) {
        self.name = name
        self.nutrientCount = nutrientCount
        self.ingredients = ingredients
    }
    
}
