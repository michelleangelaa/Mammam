//
//  AllergenSamples.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 22/12/24.
//

import Foundation

extension Allergen {
    static var sampleAllergens: [Allergen] {
        [
            Allergen(name: "Egg", image: "i_authentication_egg", isAllergy: false),
            Allergen(name: "Dairy", image: "i_authentication_dairy", isAllergy: false),
            Allergen(name: "Fish", image: "i_authentication_fish", isAllergy: false),
            Allergen(name: "Gluten", image: "i_authentication_gluten",isAllergy: false),
            Allergen(name: "Non-halal", image: "i_authentication_nonhalal", isAllergy: false),
            Allergen(name: "Soy", image: "i_authentication_soy", isAllergy: false),
            Allergen(name: "Treenut", image: "i_authentication_treenut", isAllergy: false),
            Allergen(name: "Shellfish", image: "i_authentication_shellfish", isAllergy: false),
            Allergen(name: "Peanut", image: "i_authentication_peanut", isAllergy: false)
        ]
    }
}


