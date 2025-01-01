//
//  Menu.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

@Model
class FoodMenu: ObservableObject{
    var name: String
    var image: String
    var isSaved: Bool
    var desc: String

    @Relationship
    var ingredients: [Ingredient]?

    @Relationship(inverse: \Allergen.menus)
    var allergens: [Allergen]?

    init(name: String, image: String, isSaved: Bool, desc: String, ingredients: [Ingredient], allergens: [Allergen]) {
        self.name = name
        self.image = image
        self.isSaved = isSaved
        self.desc = desc
        self.ingredients = ingredients
        self.allergens = allergens
    }
}

extension FoodMenu: Hashable {
    static func == (lhs: FoodMenu, rhs: FoodMenu) -> Bool {
        lhs.name == rhs.name && lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(image)
    }
}
