//
//  DataController.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 23/12/24.
//

import SwiftData
import Foundation

@MainActor
class DataController {
    static let shared = DataController()
    var container: ModelContainer!
    
    private init() {
        do {
            let schema = Schema([
                Ingredient.self,
                FoodMenu.self,
                Nutrient.self,
                Allergen.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema)
            container = try ModelContainer(for: schema, configurations: modelConfiguration)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }
    
//    func initializeDataIfNeeded() {
//        // Check if data already exists
//        let context = container.mainContext
//        let fetchDescriptor = FetchDescriptor<Ingredient>()
//        
//        do {
//            let existingIngredients = try context.fetch(fetchDescriptor)
//            if existingIngredients.isEmpty {
//                print("Generating initial data...")
//                generateInitialData(context: context)
//            } else {
//                print("Data already exists, skipping initialization")
//            }
//        } catch {
//            print("Error checking for existing data: \(error)")
//        }
//    }
//    
    func initializeDataIfNeeded() {
        let ingredientsFetchDescriptor = FetchDescriptor<Ingredient>()
        do {
            let existingIngredients = try container.mainContext.fetch(ingredientsFetchDescriptor)
            if existingIngredients.isEmpty {
                // Only initialize sample data if no ingredients exist
                let nutrients = Nutrient.sampleNutrients
                let ingredients = Ingredient.sampleIngredients(with: nutrients)
                
                // Insert nutrients and ingredients
                nutrients.forEach { container.mainContext.insert($0) }
                ingredients.forEach { container.mainContext.insert($0) }
                
                try container.mainContext.save()
            }
        } catch {
            print("Failed to check or initialize data: \(error)")
        }
    }
    
    private func generateInitialData(context: ModelContext) {
        // Create and insert nutrients
        let protein = Nutrient(name: "Protein", nutrientCount: 0)
        let fat = Nutrient(name: "Fat", nutrientCount: 0)
        let zinc = Nutrient(name: "Zinc", nutrientCount: 0)
        let micro = Nutrient(name: "MicroNutrient", nutrientCount: 0)
        let iron = Nutrient(name: "Iron", nutrientCount: 0)
        let carbo = Nutrient(name: "Carbo", nutrientCount: 0)
        
        let nutrients = [protein, fat, zinc, micro, iron, carbo]
        nutrients.forEach { context.insert($0) }
        
        // Create and insert allergens
        let eggAllergen = Allergen(name: "Egg", image: "i_authentication_egg")
        let dairyAllergen = Allergen(name: "Dairy", image: "i_authentication_dairy")
        
        [eggAllergen, dairyAllergen].forEach { context.insert($0) }
        
        // Create egg ingredient
        let egg = Ingredient(
            name: "Egg",
            image: "egg",
            nutrients: [protein, fat, iron]
        )
        context.insert(egg)
        
        // Create menus
        let meatEggPorrige = FoodMenu(
            name: "Meat Egg Porrige",
            image: "meateggporridge",
            isSaved: false,
            desc: "60 grams of rice\n60 grams of minced beef\n½ egg, lightly beaten\n3 broccoli florets, cut into small pieces\n50 ml water\n1 clove of garlic\n1 shallot\n½ teaspoon soy sauce\n½ teaspoon sesame oil\n1 teaspoon butter\nGround pepper to taste\nSalt to taste (if needed)",
            ingredients: [egg],
            allergens: [eggAllergen]
        )
        
        let cheeseMacaroni = FoodMenu(
            name: "Cheese Macaroni",
            image: "cheesemacaroni",
            isSaved: false,
            desc: "",
            ingredients: [egg],
            allergens: [eggAllergen, dairyAllergen]
        )
        
        let butterChickenPorriage = FoodMenu(
            name: "Butter Chicken Porriage",
            image: "butterchickenporridge",
            isSaved: false,
            desc: "",
            ingredients: [egg],
            allergens: [eggAllergen, dairyAllergen]
        )
        
        [meatEggPorrige, cheeseMacaroni, butterChickenPorriage].forEach { context.insert($0) }
        
        // Connect menus to egg ingredient
        egg.menus = [meatEggPorrige, cheeseMacaroni, butterChickenPorriage]
        
        // Create other ingredients
        let potato = Ingredient(
            name: "Potato",
            image: "potato",
            nutrients: [carbo, micro]
        )
        
        let tomato = Ingredient(
            name: "Tomato",
            image: "tomato",
            nutrients: [micro]
        )
        
        let berries = Ingredient(
            name: "Berries",
            image: "berries",
            nutrients: [zinc, micro]
        )
        
        [potato, tomato, berries].forEach { context.insert($0) }
        
        // Link ingredients and nutrients
        [egg, potato, tomato, berries].forEach { ingredient in
            ingredient.nutrients?.forEach { nutrient in
                if nutrient.ingredients == nil {
                    nutrient.ingredients = []
                }
                if !(nutrient.ingredients?.contains(ingredient) ?? false) {
                    nutrient.ingredients?.append(ingredient)
                }
            }
        }
        
        // Save the context
        try? context.save()
    }
}
