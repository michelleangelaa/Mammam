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
        let carbs = nutrients.first(where: { $0.name == "Carbo" })

        let egg = Ingredient(
            name: "Egg",
            image: "i_egg",
            nutrients: [protein, fat, iron].compactMap { $0 }
        )

        let chickenLiver = Ingredient(
            name: "Chicken Liver",
            image: "i_chickenliver",
            nutrients: [protein, fat, iron].compactMap { $0 }
        )

        let lamb = Ingredient(
            name: "Lamb",
            image: "i_lamb",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let duck = Ingredient(
            name: "Duck",
            image: "i_duck",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let beefLiver = Ingredient(
            name: "Beef Liver",
            image: "i_beefliver",
            nutrients: [protein, iron].compactMap { $0 }
        )

        let mincedBeef = Ingredient(
            name: "Minced Beef",
            image: "i_mincedbeef",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let tofu = Ingredient(
            name: "Tofu",
            image: "i_tofu",
            nutrients: [protein].compactMap { $0 }
        )

        let shrimp = Ingredient(
            name: "Shrimp",
            image: "i_shrimp",
            nutrients: [protein, iron].compactMap { $0 }
        )

        let catfish = Ingredient(
            name: "Catfish",
            image: "i_catfish",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let longJawedMackerel = Ingredient(
            name: "Long Jawed Mackerel",
            image: "i_longjawedmackerel",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let quail = Ingredient(
            name: "Quail",
            image: "i_quail",
            nutrients: [protein, fat].compactMap { $0 }
        )

        
        let tilapiaFish = Ingredient(
            name: "Tilapia Fish",
            image: "i_tilapiafish",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let snapperFish = Ingredient(
            name: "Snapper Fish",
            image: "i_snapperfish",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let chickenBroth = Ingredient(
            name: "Chicken Broth",
            image: "i_chickenbroth",
            nutrients: [protein].compactMap { $0 }
        )

        let fishBroth = Ingredient(
            name: "Fish Broth",
            image: "i_fishbroth",
            nutrients: [protein].compactMap { $0 }
        )

        let yogurt = Ingredient(
            name: "Yogurt",
            image: "i_yougurt",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let cheese = Ingredient(
            name: "Cheese",
            image: "i_cheese",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let tunaFish = Ingredient(
            name: "Tuna Fish",
            image: "i_tunafish",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let dori = Ingredient(
            name: "Dori",
            image: "i_dori",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let fishBalls = Ingredient(
            name: "Fish Balls",
            image: "i_fishballs",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let peas = Ingredient(
            name: "Peas",
            image: "i_peas",
            nutrients: [protein, carbs].compactMap { $0 }
        )

        let tempeh = Ingredient(
            name: "Tempeh",
            image: "i_tempeh",
            nutrients: [protein, iron].compactMap { $0 }
        )

        let mungBeans = Ingredient(
            name: "Mung Beans",
            image: "i_mungbean",
            nutrients: [protein, carbs].compactMap { $0 }
        )

        let soyBeans = Ingredient(
            name: "Soy Beans",
            image: "i_soybean",
            nutrients: [protein, carbs].compactMap { $0 }
        )

        let redBeans = Ingredient(
            name: "Red Beans",
            image: "i_redbean",
            nutrients: [protein, carbs].compactMap { $0 }
        )

        let peanuts = Ingredient(
            name: "Peanuts",
            image: "i_peanuts",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let potato = Ingredient(
            name: "Potato",
            image: "i_potato",
            nutrients: [carbs].compactMap { $0 }
        )

        let eggNoodle = Ingredient(
            name: "Egg Noodle",
            image: "i_eggnoodle",
            nutrients: [carbs].compactMap { $0 }
        )

        let oatFlour = Ingredient(
            name: "Oat Flour",
            image: "i_oatflour",
            nutrients: [carbs].compactMap { $0 }
        )

        let glutinousRice = Ingredient(
            name: "Glutinous Rice",
            image: "i_glutinousrice",
            nutrients: [carbs].compactMap { $0 }
        )

        let jellyPowder = Ingredient(
            name: "Jelly Powder",
            image: "i_jellypowder",
            nutrients: [carbs].compactMap { $0 }
        )

        let bihun = Ingredient(
            name: "Bihun",
            image: "i_bihun",
            nutrients: [carbs].compactMap { $0 }
        )

        let ricePorridge = Ingredient(
            name: "Rice Porridge",
            image: "i_riceporridge",
            nutrients: [carbs].compactMap { $0 }
        )

        let macaroni = Ingredient(
            name: "Macaroni",
            image: "i_macaroni",
            nutrients: [carbs].compactMap { $0 }
        )

        let whiteRice = Ingredient(
            name: "White Rice",
            image: "i_whiterice",
            nutrients: [carbs].compactMap { $0 }
        )

        let whiteBread = Ingredient(
            name: "White Bread",
            image: "i_whitebread",
            nutrients: [carbs].compactMap { $0 }
        )

        let cassava = Ingredient(
            name: "Cassava",
            image: "i_cassava",
            nutrients: [carbs].compactMap { $0 }
        )

        let taro = Ingredient(
            name: "Taro",
            image: "i_taro",
            nutrients: [carbs].compactMap { $0 }
        )

        let riceFlour = Ingredient(
            name: "Rice Flour",
            image: "i_riceflour",
            nutrients: [carbs].compactMap { $0 }
        )

        let flour = Ingredient(
            name: "Flour",
            image: "i_flour",
            nutrients: [carbs].compactMap { $0 }
        )

        let ubi = Ingredient(
            name: "Ubi",
            image: "i_ubi",
            nutrients: [carbs].compactMap { $0 }
        )

        let coconutMilk = Ingredient(
            name: "Coconut Milk",
            image: "i_coconutmilk",
            nutrients: [fat].compactMap { $0 }
        )
               
        let coconutOil = Ingredient(
            name: "Coconut Oil",
            image: "i_coconutoil",
            nutrients: [fat, micro].compactMap { $0 }
        )
           
        let cornOil = Ingredient(
            name: "Corn Oil",
            image: "i_cornoil",
            nutrients: [fat].compactMap { $0 }
        )
           
        let canolaOil = Ingredient(
            name: "Canola Oil",
            image: "i_canolaoil",
            nutrients: [fat].compactMap { $0 }
        )
            
        let soybeanOil = Ingredient(
            name: "Soybean Oil",
            image: "i_soyoil",
            nutrients: [fat, micro].compactMap { $0 }
        )
        
        let sesameOil = Ingredient(
            name: "Sesame Oil",
            image: "i_sesameoil",
            nutrients: [fat, micro].compactMap { $0 }
        )
        
        let butter = Ingredient(
            name: "Butter",
            image: "i_butter",
            nutrients: [fat].compactMap { $0 }
        )
            
        let candlenut = Ingredient(
            name: "Candlenut",
            image: "i_candlenut",
            nutrients: [fat, micro].compactMap { $0 }
        )
        
        let squid = Ingredient(
            name: "Squid",
            image: "i_squid",
            nutrients: [protein, zinc, micro].compactMap { $0 }
        )
          
        let buffaloMeat = Ingredient(
            name: "Buffalo Meat",
            image: "i_buffalo",
            nutrients: [protein, iron, fat].compactMap { $0 }
        )
            
        let saltedFish = Ingredient(
            name: "Salted Fish",
            image: "i_saltedfish",
            nutrients: [protein, zinc].compactMap { $0 }
        )
         
        let catFish = Ingredient(
            name: "Catfish",
            image: "i_catfish",
            nutrients: [protein, fat].compactMap { $0 }
        )
        
        let carp = Ingredient(
            name: "Carp",
            image: "i_carp",
            nutrients: [protein, fat, zinc].compactMap { $0 }
        )
            
        let clams = Ingredient(
            name: "Clams",
            image: "i_clam",
            nutrients: [protein, iron, zinc].compactMap { $0 }
        )
           
        let meatball = Ingredient(
            name: "Meatball",
            image: "i_meatball",
            nutrients: [protein, fat].compactMap { $0 }
        )
            
        let eggYolk = Ingredient(
            name: "Egg Yolk",
            image: "i_eggyolk",
            nutrients: [protein, fat, micro].compactMap { $0 }
        )
        
        let duckEgg = Ingredient(
            name: "Duck Egg",
            image: "i_duckegg",
            nutrients: [protein, fat, zinc].compactMap { $0 }
        )
            
        let chickenWithSkin = Ingredient(
            name: "Chicken with Skin",
            image: "i_chicken",
            nutrients: [protein, fat].compactMap { $0 }
        )

        let okra = Ingredient(
            name: "Okra",
            image: "i_okra",
            nutrients: [micro].compactMap { $0 }
        )
        
        let cucumber = Ingredient(
            name: "Cucumber",
            image: "i_cucumber",
            nutrients: [micro].compactMap { $0 }
        )
         
        let avocado = Ingredient(
            name: "Avocado",
            image: "i_avocado",
            nutrients: [fat, micro].compactMap { $0 }
        )
           
        let blackJellyMushroom = Ingredient(
            name: "Black Jelly Mushroom",
            image: "i_blackjellymushroom",
            nutrients: [micro].compactMap { $0 }
        )
            
        let radish = Ingredient(
            name: "Radish",
            image: "i_radish",
            nutrients: [micro].compactMap { $0 }
        )
        
        let waterGourd = Ingredient(
            name: "Water Gourd",
            image: "i_watergourd",
            nutrients: [micro].compactMap { $0 })
        
        let eggPlant = Ingredient(
            name: "Eggplant",
            image: "i_eggplant",
            nutrients: [micro].compactMap { $0 })
        
        let babyCorn = Ingredient(name: "Baby Corn", image: "i_babycorn", nutrients: [micro, carbs].compactMap { $0 })
        let cabbage = Ingredient(name: "Cabbage", image: "i_cabbage", nutrients: [micro].compactMap { $0 })
        let cassavaLeaves = Ingredient(name: "Cassava Leaves", image: "i_cassavaleaves", nutrients: [micro, iron].compactMap { $0 })
        let grape = Ingredient(name: "Grape", image: "i_grape", nutrients: [carbs, micro].compactMap { $0 })
        let langsat = Ingredient(name: "Langsat", image: "i_langsat", nutrients: [carbs, micro].compactMap { $0 })
        let durian = Ingredient(name: "Durian", image: "i_durian", nutrients: [carbs, fat, micro].compactMap { $0 })
        let wateryRoseApples = Ingredient(name: "Watery Rose Apples", image: "i_watertroseapple", nutrients: [carbs, micro].compactMap { $0 })
        let Dates = Ingredient(name: "Dates", image: "i_dates", nutrients: [carbs, micro].compactMap { $0 })
        let pear = Ingredient(name: "Pear", image: "i_pear", nutrients: [carbs, micro].compactMap { $0 })
        let watermelon = Ingredient(name: "Watermelon", image: "i_watermelon", nutrients: [carbs, micro].compactMap { $0 })
        let snakeFruit = Ingredient(name: "Snake Fruit", image: "i_snakefruit", nutrients: [carbs, micro].compactMap { $0 })
        let mangosteen = Ingredient(name: "Mangosteen", image: "i_mangosteen", nutrients: [carbs, micro].compactMap { $0 })
        let soursop = Ingredient(name: "Soursop", image: "i_soursop", nutrients: [carbs, micro].compactMap { $0 })
        let lychee = Ingredient(name: "Lychee", image: "i_lychee", nutrients: [carbs, micro].compactMap { $0 })
        let ambarella = Ingredient(name: "Ambarella", image: "i_ambarella", nutrients: [carbs, micro].compactMap { $0 })
        let broccoli = Ingredient(name: "Broccoli", image: "i_broccoli", nutrients: [micro, iron].compactMap { $0 })
        let spinach = Ingredient(name: "Spinach", image: "i_spinach", nutrients: [micro, iron].compactMap { $0 })
        
        // Create allergens
        let eggAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Egg" })
        let dairyAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Dairy" })
        let fishAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Fish" })
        let glutenAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Gluten" })
        let nonhalalAllergen =  Allergen.sampleAllergens.first(where: { $0.name == "Nonhalal" })
        let soyAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Soy" })
        let treenutAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Treenut" })
        let shellfishAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Shellfish" })
        let peanutAllergen = Allergen.sampleAllergens.first(where: { $0.name == "Peanut" })
     

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


        return [egg, potato]
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
