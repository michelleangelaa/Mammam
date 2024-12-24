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
    
    init(name: String, image: String, menus: [FoodMenu]? = nil) {
        self.name = name
        self.image = image
        self.menus = menus
    }
}
