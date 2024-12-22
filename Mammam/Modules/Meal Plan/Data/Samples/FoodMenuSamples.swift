//
//  FoodMenuSamples.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 22/12/24.
//

import Foundation
import SwiftData

extension FoodMenu {
    static var sampleMenus: [FoodMenu] = {
        guard let eggIngredient = myIngredients.first(where: { $0.name == "Egg" }),
              let menus = eggIngredient.menus else {
            return []
        }
        return menus
    }()
}

