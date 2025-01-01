//
//  IngredientSamples.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

extension Ingredient {
    static func sampleIngredients(with nutrients: [Nutrient]) -> [Ingredient] {
        let protein = nutrients.first(where: { $0.name == "Protein" })
        let fat = nutrients.first(where: { $0.name == "Fat" })
        let zinc = nutrients.first(where: { $0.name == "Zinc" })
        let micro = nutrients.first(where: { $0.name == "MicroNutrient" })
        let iron = nutrients.first(where: { $0.name == "Iron" })
        let carbo = nutrients.first(where: { $0.name == "Carbo" })

        let egg = Ingredient(
            name: "Egg",
            image: "egg",
            nutrients: [protein, fat, iron].compactMap { $0 }
        )

        // Create allergens
        let eggAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Egg" })
        let dairyAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Dairy" })

        // Create menus with egg ingredient
        let meatEggPorrige = FoodMenu(
            name: "Meat Egg Porrige",
            image: "meateggporridge",
            isSaved: false,
            desc: "60 grams of rice\n60 grams of minced beef\n½ egg, lightly beaten\n3 broccoli florets, cut into small pieces\n50 ml water\n1 clove of garlic\n1 shallot\n½ teaspoon soy sauce\n½ teaspoon sesame oil\n1 teaspoon butter\nGround pepper to taste\nSalt to taste (if needed)",
            ingredients: [egg],
            allergens: [eggAllergen].compactMap { $0 }
        )

        let cheeseMacaroni = FoodMenu(
            name: "Cheese Macaroni",
            image: "cheesemacaroni",
            isSaved: false,
            desc: "",
            ingredients: [egg],
            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
        )

        let butterChickenPorriage = FoodMenu(
            name: "Butter Chicken Porriage",
            image: "butterchickenporridge",
            isSaved: false,
            desc: "",
            ingredients: [egg],
            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
        )

        // Connect menus to egg ingredient
        egg.menus = [meatEggPorrige, cheeseMacaroni, butterChickenPorriage]

        let potato = Ingredient(
            name: "Potato",
            image: "potato",
            nutrients: [carbo, micro].compactMap { $0 }
        )

        let tomato = Ingredient(
            name: "Tomato",
            image: "tomato",
            nutrients: [micro].compactMap { $0 }
        )

        let berries = Ingredient(
            name: "Berries",
            image: "berries",
            nutrients: [zinc, micro].compactMap { $0 }
        )

        return [egg, potato, tomato, berries]
    }
    
    // Add this new method to fetch existing ingredients
    static func getExistingIngredients(context: ModelContext) -> [Ingredient] {
        let descriptor = FetchDescriptor<Ingredient>()
        return (try? context.fetch(descriptor)) ?? []
    }
    
    // Add this method to find a specific ingredient by name
    static func findIngredient(named name: String, context: ModelContext) -> Ingredient? {
        let descriptor = FetchDescriptor<Ingredient>(
            predicate: #Predicate<Ingredient> { ingredient in
                ingredient.name == name
            }
        )
        return try? context.fetch(descriptor).first
    }
}

func linkIngredientsAndNutrients(ingredients: [Ingredient], nutrients: [Nutrient]) {
    for ingredient in ingredients {
        ingredient.nutrients?.forEach { nutrient in
            if nutrient.ingredients == nil {
                nutrient.ingredients = []
            }
            if !(nutrient.ingredients?.contains(ingredient) ?? false) {
                nutrient.ingredients?.append(ingredient)
            }
        }
    }
}

extension Ingredient {
    static var sampleIngredients: [Ingredient] {
        let defaultNutrients = Nutrient.sampleNutrients
        return sampleIngredients(with: defaultNutrients)
    }
}

let myNutrients = Nutrient.sampleNutrients
let myIngredients = Ingredient.sampleIngredients(with: myNutrients)

// linkIngredientsAndNutrients(ingredients: myIngredients, nutrients: myNutrients)
