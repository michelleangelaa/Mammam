//
//  DataSamples.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

//func createSampleData() -> [Meal] {
//    // Nutrients
//    let protein = Nutrient(name: "Protein", nutrientCount: 10)
//    let omega3 = Nutrient(name: "Omega 3", nutrientCount: 3)
//    let carbo = Nutrient(name: "Carbohydrate", nutrientCount: 0)
//
//    // Ingredients
//    let egg = Ingredient(name: "Egg", image: "egg_image", nutrients: [protein, omega3])
//    let chicken = Ingredient(name: "Chicken", image: "chicken_image", nutrients: [protein])
//    let bread = Ingredient(name: "Bread", image: "bread_image", nutrients: [carbo])
//    
//    // Meals
//    let meal1 = Meal(ingredient: egg, type: "Breakfast", timeGiven: Date(), timeEnded: Date().addingTimeInterval(1800), servingUnit: "Cup", servingQty: 3, consumedQty: 2, isAllergic: false, isLogged: true, notes: "Eggs were boiled")
//    let meal2 = Meal(ingredient: chicken, type: "Lunch", timeGiven: Date(), timeEnded: Date().addingTimeInterval(2000), servingUnit: "Cup", servingQty: 4, consumedQty: 1, isAllergic: true, isLogged: true, notes: "Rash")
//    
//    // Meal Plan
//    let week1 = MealPlan(startDate: Date(), endDate: Date().addingTimeInterval(2 * 86400), meals: [meal1, meal2])
//    
//    // Allergens
//    let eggAllergy = Allergen(name: "Egg", image: "allergen_egg_icon")
//    let nutAllergy = Allergen(name: "Nut", image: "allergen_nut_icon")
//    
//    // Menus
//    let eggBenedict = Menu(name: "Egg Benedict", image: "menu_egg_benedict_image", isSaved: true, ingredients: [egg, bread], allergens: [eggAllergy])
//    let omelette = Menu(name: "Omelette", image: "menu_omelette_image", isSaved: true, ingredients: [egg], allergens: [eggAllergy])
//    let chickenSoup = Menu(name: "Chicken Soup", image: "menu_chicken_soup_image", isSaved: true, ingredients: [chicken], allergens: [])
//    
//    // Assign Relationships
//    // Many to many [Ingredients - Menu]
//    egg.menus = [eggBenedict, omelette]
//    chicken.menus = [chickenSoup]
//    
//    // Many to many [Nutrient - Ingredient]
//    protein.ingredients = [egg, chicken]
//    omega3.ingredients = [egg]
//    
//    // Assign meals to ingredients
//    meal1.ingredient = egg
//    meal2.ingredient = chicken
//    
//    // Assign meal plan to meals
//    meal1.mealPlan = week1
//    meal2.mealPlan = week1
//    
//    return [meal1, meal2]
//}

//func createSampleMenus(context: ModelContext) -> [FoodMenu] {
//    // Nutrients
//    let protein = Nutrient(name: "Protein", nutrientCount: 10)
//    let omega3 = Nutrient(name: "Omega 3", nutrientCount: 3)
//    let carbo = Nutrient(name: "Carbohydrate", nutrientCount: 0)
//
//    // Ingredients
//    let egg = Ingredient(name: "Egg", image: "egg_image", nutrients: [protein, omega3])
//    let chicken = Ingredient(name: "Chicken", image: "chicken_image", nutrients: [protein])
//    let bread = Ingredient(name: "Bread", image: "bread_image", nutrients: [carbo])
//    
//    // Allergens
//    let eggAllergy = Allergen(name: "Egg", image: "allergen_egg_icon")
//    let nutAllergy = Allergen(name: "Nut", image: "allergen_nut_icon")
//    
//    // Menus
//    let eggBenedict = FoodMenu(name: "Egg Benedict", image: "menu_egg_benedict_image", isSaved: true, ingredients: [egg, bread], allergens: [eggAllergy])
//    let omelette = FoodMenu(name: "Omelette", image: "menu_omelette_image", isSaved: true, ingredients: [egg], allergens: [eggAllergy])
//    let chickenSoup = FoodMenu(name: "Chicken Soup", image: "menu_chicken_soup_image", isSaved: true, ingredients: [chicken], allergens: [])
//    
//    // Assign Relationships
//    egg.menus = [eggBenedict, omelette]
//    chicken.menus = [chickenSoup]
//    
//    // Insert data into the context
//    context.insert(eggBenedict)
//    context.insert(omelette)
//    context.insert(chickenSoup)
//    
//    context.insert(egg)
//    context.insert(chicken)
//    context.insert(bread)
//    context.insert(eggAllergy)
//    context.insert(nutAllergy)
//    context.insert(protein)
//    context.insert(omega3)
//    context.insert(carbo)
//    
//    do {
//        try context.save()
//    } catch {
//        print("Failed to save context: \(error)")
//    }
//    
//    return [eggBenedict, omelette, chickenSoup]
//}
