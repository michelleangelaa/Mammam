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
    
    var allergens: [Allergen]?
    
    init(name: String, image: String? = nil, nutrients: [Nutrient]? = nil, allergens: [Allergen]? = nil) {
        self.name = name
        self.image = image
        self.nutrients = nutrients
        self.allergens = allergens
    }
    
    var isSafeToShow: Bool {
        return !(allergens?.contains { $0.isAllergy } ?? false)
    }

    static func fetchSafeIngredients(context: ModelContext) -> [Ingredient] {
        let fetchDescriptor = FetchDescriptor<Ingredient>()
        
        if let allIngredients = try? context.fetch(fetchDescriptor) {
            return allIngredients.filter { $0.isSafeToShow }
        }
        
        return []
    }
}



