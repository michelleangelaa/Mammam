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
   
    @Relationship(inverse: \Nutrient.ingredients)
    var nutrients: [Nutrient]?
        
    @Relationship(inverse: \Meal.ingredient)
    var meals: [Meal]?
        
    @Relationship(inverse: \FoodMenu.ingredients)
    var menus: [FoodMenu]?
    
    var allergens: [Allergen]?  // Ingredients may contain allergens


//    @Relationship(inverse: \Nutrition.ingredients)
    
    init(name: String, image: String? = nil, nutrients: [Nutrient]? = nil) {
        self.name = name
        self.image = image
        self.nutrients = nutrients
    }
}
