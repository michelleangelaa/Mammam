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
                Allergen.self,
                Meal.self,
//                Motivation.self,
                Article.self,
                Baby.self,
                User.self
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
    

    
   func generateSampleData() {
            let context = container.mainContext

            generateBabyData(context: context)
//            generateMotivationData(context: context)
            generateArticleData(context: context)
            generateallergenData(context:context)

            do {
                try context.save()
                print("data saved")
            } catch {
                print("Error saving sample data: \(error)")
            }
        }

        private func generateBabyData(context: ModelContext) {
            let baby = Baby(babyProfileImage: "i_profile_person", babyName: "Eve", babyBirthDate: Date())
            context.insert(baby)
            print("data saved")
        }

    private func generateArticleData(context: ModelContext) {
            let article = Article(
                articleTitle: "Introduce new food with food chaining",
                articleImage: "motivationimage1",
                articleSubheader: "What is Food Chaining?",
                articleDesc: """
                    Food chaining is a method that starts with feeding a food a child likes, then using small changes to work toward a new food.

                    Tips For Success:
                    - Have fun and make it a game. Encourage your child to take \"mouse bites,\" \"alligator bites,\" or touch the food with their tongue.
                    - Focus on small steps & try one new item at a time. Keep trying!
                    - Many children have to try a food more than 10 times before they start to like it.

                    Additional Tips:
                    - Minimize distractions while your child is eating. (For example, turn off screens, put pets in another room, etc.)
                    - Don't pressure your child; let them decide when they want to stop.
                    - Plan meals & snacks ahead of time. Let your child know when to expect a meal or snack.
                    """
            )
            context.insert(article)
        }

//        private func generateMotivationData(context: ModelContext) {
//            let motivation = Motivation(
//                imageStory1: "motivationimage1",
//                imageStory2: "motivationimage2",
//                imageTrue: "motivationimage3_true",
//                imageFalse: "motivationimage3_false",
////                adviceImage: ["motivationimage3_false","motivationimage3_false"],
//                quotes: "It's okay if your child rejects food today, keep offering it in different forms. Consistency is key!",
//                tips: """
//                    - Give baby more time and offer the meal again later.
//                    - You still can offer her to eat for a maximum of 30 minutes.
//                    """
//            )
//            context.insert(motivation)
//        }
    
    private func generateallergenData(context: ModelContext) {
        // Create and insert allergens
        let eggAllergen = Allergen(name: "Egg", image: "i_authentication_egg")
        let dairyAllergen = Allergen(name: "Dairy", image: "i_authentication_dairy")
        
        [eggAllergen, dairyAllergen].forEach { context.insert($0) }
        
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
