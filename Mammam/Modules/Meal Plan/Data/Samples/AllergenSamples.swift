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
            Allergen(name: "Fish", image: "i_authentication_fish"),
            Allergen(name: "Gluten", image: "i_authentication_gluten"),
            Allergen(name: "Non-halal", image: "i_authentication_nonhalal"),
            Allergen(name: "Dairy", image: "i_authentication_dairy"),
            Allergen(name: "Egg", image: "i_authentication_egg"),
            Allergen(name: "Soy", image: "i_authentication_soy"),
            Allergen(name: "Treenut", image: "i_authentication_treenut"),
            Allergen(name: "Shellfish", image: "i_authentication_shellfish"),
            Allergen(name: "Peanut", image: "i_authentication_peanut")
        ]
    }
}


