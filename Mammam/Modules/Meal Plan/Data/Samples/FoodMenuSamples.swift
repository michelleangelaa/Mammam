////
////  FoodMenuSamples.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 22/12/24.
////
//
//import Foundation
//import SwiftData
//
//
//extension FoodMenu {
//    static func sampleFoodMenu(with allergens: [Allergen]) -> [FoodMenu] {
//        let eggAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Egg" })
//        let dairyAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Dairy" })
//        let fishAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Fish" })
//        let nonhalalAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Non-halal" })
//        let soyAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Soy" })
//        let glutenAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Gluten" })
//        let peanutAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Peanut" })
//        let treenutAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Treenut" })
//        let shellfishAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Shellfish" })
//
//        let ingredientFetch = FetchDescriptor<Ingredient>()
//
//        // Create menus with egg ingredient
//        let meatEggPorrige = FoodMenu(
//            name: "Meat Egg Porrige",
//            image: "meateggporridge",
//            isSaved: false,
//            desc: "60 grams of rice\n60 grams of minced beef\n½ egg, lightly beaten\n3 broccoli florets, cut into small pieces\n50 ml water\n1 clove of garlic\n1 shallot\n½ teaspoon soy sauce\n½ teaspoon sesame oil\n1 teaspoon butter\nGround pepper to taste\nSalt to taste (if needed)",
//            ingredients: [egg],
//            allergens: [eggAllergen]
//        )
//        
//        eggAllergen?.menus?.append(meatEggPorrige)
//
//
//        let cheeseMacaroni = FoodMenu(
//            name: "Cheese Macaroni",
//            image: "cheesemacaroni",
//            isSaved: false,
//            desc: "",
//            ingredients: [egg],
//            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
//        )
//        
//        eggAllergen?.menus?.append(cheeseMacaroni)
//        dairyAllergen?.menus?.append(meatEggPorrige)
//
//
//
//        let butterChickenPorriage = FoodMenu(
//            name: "Butter Chicken Porriage",
//            image: "butterchickenporridge",
//            isSaved: false,
//            desc: "",
//            ingredients: [egg],
//            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
//        )
//        
//        eggAllergen?.menus?.append(butterChickenPorriage)
//        dairyAllergen?.menus?.append(butterChickenPorriage)
//        eggAllergen?.menus = [cheeseMacaroni, meatEggPorrige, butterChickenPorriage]
//        dairyAllergen?.menus = [butterChickenPorriage, cheeseMacaroni]
//
//
//
//        // Connect menus to egg ingredient
//        egg.menus = [meatEggPorrige, cheeseMacaroni, butterChickenPorriage]
//        
//
//        let potato = Ingredient(
//            name: "Potato",
//            image: "potato",
//            nutrients: [carbo, micro].compactMap { $0 }
//        )
//
//        let tomato = Ingredient(
//            name: "Tomato",
//            image: "tomato",
//            nutrients: [micro].compactMap { $0 }
//        )
//
//        let berries = Ingredient(
//            name: "Berries",
//            image: "berries",
//            nutrients: [zinc, micro].compactMap { $0 }
//        )
//
//        return [egg, potato, tomato, berries]
//    }
//
//    // Add this new method to fetch existing ingredients
//    static func getExistingIngredients(context: ModelContext) -> [Ingredient] {
//        let descriptor = FetchDescriptor<Ingredient>()
//        return (try? context.fetch(descriptor)) ?? []
//    }
//
//    // Add this method to find a specific ingredient by name
//    static func findIngredient(named name: String, context: ModelContext) -> Ingredient? {
//        let descriptor = FetchDescriptor<Ingredient>(
//            predicate: #Predicate<Ingredient> { ingredient in
//                ingredient.name == name
//            }
//        )
//        return try? context.fetch(descriptor).first
//    }
//}
//
//func linkIngredientsAndNutrients(ingredients: [Ingredient], nutrients: [Nutrient]) {
//    for ingredient in ingredients {
//        ingredient.nutrients?.forEach { nutrient in
//            if nutrient.ingredients == nil {
//                nutrient.ingredients = []
//            }
//            if !(nutrient.ingredients?.contains(ingredient) ?? false) {
//                nutrient.ingredients?.append(ingredient)
//            }
//        }
//    }
//}
//
//extension Ingredient {
//    static var sampleIngredients: [Ingredient] {
//        let defaultNutrients = Nutrient.sampleNutrients
//        return sampleIngredients(with: defaultNutrients)
//    }
//}
//
//let myNutrients = Nutrient.sampleNutrients
//let myIngredients = Ingredient.sampleIngredients(with: myNutrients)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// Extend IngredientSamples functionality
////extension FoodMenu {
////    // Add this method to fetch existing FoodMenus
////    static func getExistingMenus(context: ModelContext) -> [FoodMenu] {
////        let descriptor = FetchDescriptor<FoodMenu>()
////        return (try? context.fetch(descriptor)) ?? []
////    }
////    
////    // Add this method to find a specific FoodMenu by name
////    static func findMenu(named name: String, context: ModelContext) -> FoodMenu? {
////        let descriptor = FetchDescriptor<FoodMenu>(
////            predicate: #Predicate<FoodMenu> { menu in
////                menu.name == name
////            }
////        )
////        return try? context.fetch(descriptor).first
////    }
////}
////
////func linkMenusAndAllergens(menus: [FoodMenu], allergens: [Allergen]) {
////    for menu in menus {
////        menu.allergens?.forEach { allergen in
////            if allergen.menus == nil {
////                allergen.menus = []
////            }
////            if !(allergen.menus?.contains(menu) ?? false) {
////                allergen.menus?.append(menu)
////            }
////        }
////    }
////    for allergen in allergens {
////        allergen.menus?.forEach { menu in
////            if menu.allergens == nil {
////                menu.allergens = []
////            }
////            if !(menu.allergens?.contains(allergen) ?? false) {
////                menu.allergens?.append(allergen)
////            }
////        }
////    }
////}
////
////// Use this in your initialization logic
////func initializeMenusAndAllergens(context: ModelContext) {
////    // Fetch or create allergens and menus
////    let existingAllergens = Allergen.sampleAllergens
////    let existingMenus = FoodMenu.getExistingMenus(context: context)
////    
////    // Link menus and allergens
////    linkMenusAndAllergens(menus: existingMenus, allergens: existingAllergens)
////    
////    // Save the context
////    try? context.save()
////}
