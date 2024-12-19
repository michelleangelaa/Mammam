//
//  Ingredient.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 06/12/24.
//

import Foundation
import SwiftData

@Model
class Ingredient{
    var name: String
    var image: String?
    var nutrients: [Nutrient]?
    @Relationship(inverse: \Meal.ingredient)
    var meals: [Meal]?
    var menus: [FoodMenu]?

    
//    @Relationship(inverse: \Nutrition.ingredients)
    
    init(name: String, image: String? = nil, nutrients: [Nutrient]? = nil) {
        self.name = name
        self.image = image
        self.nutrients = nutrients
    }
}
