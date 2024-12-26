//
//  Ingredient.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 06/12/24.
//

import Foundation
import SwiftData

@Model
class Ingredient {
    var name: String
    var image: String?
//    var desc: String?
   
    @Relationship(inverse: \Nutrient.ingredients)
    var nutrients: [Nutrient]?
        
    @Relationship(inverse: \Meal.ingredient)
    var meals: [Meal]?
        
    @Relationship(inverse: \FoodMenu.ingredients)
    var menus: [FoodMenu]?

//    @Relationship(inverse: \Nutrition.ingredients)
    // desc: String? = nil,
    
    init(name: String, image: String? = nil, nutrients: [Nutrient]? = nil) {
        self.name = name
        self.image = image
//        self.desc = desc
        self.nutrients = nutrients
    }
}
