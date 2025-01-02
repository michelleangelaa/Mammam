//
//  Allergen.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

@Model
class Allergen {
    var name: String
    var image: String
    var menus: [FoodMenu]?
    var isAllergy: Bool
    
//    @Relationship(inverse: \Baby.allergen)
//    var baby: Baby?
    
    init(name: String, image: String, menus: [FoodMenu]? = nil, isAllergy: Bool) {
        self.name = name
        self.image = image
        self.menus = menus
        self.isAllergy = isAllergy
    }
}
