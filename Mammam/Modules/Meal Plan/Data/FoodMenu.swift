//
//  Menu.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

@Model
class FoodMenu {
    var name: String
    var image: String
    var isSaved: Bool

    @Relationship
    var ingredients: [Ingredient]?

    @Relationship(inverse: \Allergen.menus)
    var allergens: [Allergen]?

    init(name: String, image: String, isSaved: Bool, ingredients: [Ingredient], allergens: [Allergen]) {
        self.name = name
        self.image = image
        self.isSaved = isSaved
        self.ingredients = ingredients
        self.allergens = allergens
    }
}
