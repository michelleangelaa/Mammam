//
//  IngredientSamples.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import Foundation
import SwiftData

extension Ingredient {
    static func sampleIngredients(with nutrients: [Nutrient], context: ModelContext? = nil) -> [Ingredient] {
        let protein = nutrients.first(where: { $0.name == "Protein" })
        let fat = nutrients.first(where: { $0.name == "Fat" })
        let zinc = nutrients.first(where: { $0.name == "Zinc" })
        let micro = nutrients.first(where: { $0.name == "MicroNutrient" })
        let iron = nutrients.first(where: { $0.name == "Iron" })
        let carbs = nutrients.first(where: { $0.name == "Carbo" })
        
        var eggAllergen: Allergen?
        var dairyAllergen: Allergen?
        var fishAllergen: Allergen?
        var glutenAllergen: Allergen?
        var nonhalalAllergen: Allergen?
        var soyAllergen: Allergen?
        var treenutAllergen: Allergen?
        var peanutAllergen: Allergen?
        var shellfishAllergen: Allergen?

        if let context = context {
            let allergenFetch = FetchDescriptor<Allergen>()
            if let existingAllergens = try? context.fetch(allergenFetch) {
                eggAllergen = existingAllergens.first(where: { $0.name == "Egg" })
                dairyAllergen = existingAllergens.first(where: { $0.name == "Dairy" })
                fishAllergen = existingAllergens.first(where: { $0.name == "Fish" })
                glutenAllergen = existingAllergens.first(where: { $0.name == "Gluten" })
                nonhalalAllergen = existingAllergens.first(where: { $0.name == "Non-Halal" })
                soyAllergen = existingAllergens.first(where: { $0.name == "Soy" })
                treenutAllergen = existingAllergens.first(where: { $0.name == "Treenut" })
                peanutAllergen = existingAllergens.first(where: { $0.name == "Peanut" })
                shellfishAllergen = existingAllergens.first(where: { $0.name == "Shellfish" })
            }
        }

        let egg = Ingredient(
            name: "Egg",
            image: "i_egg",
            nutrients: [protein, fat, iron].compactMap { $0 },
            allergens: [eggAllergen].compactMap { $0 }
        )


        let chickenLiver = Ingredient(
            name: "Chicken Liver",
            image: "i_chickenliver",
            nutrients: [protein, fat, iron].compactMap { $0 }
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
            nutrients: [protein].compactMap { $0 },
            allergens: [soyAllergen].compactMap { $0 }
        )

        let shrimp = Ingredient(
            name: "Shrimp",
            image: "i_shrimp",
            nutrients: [protein, iron].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
        )

        let catfish = Ingredient(
            name: "Catfish",
            image: "i_catfish",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }

        )

        let longJawedMackerel = Ingredient(
            name: "Long Jawed Mackerel",
            image: "i_longjawedmackerel",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
        )

        let quail = Ingredient(
            name: "Quail",
            image: "i_quail",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [eggAllergen].compactMap { $0 }
        )

        let tilapiaFish = Ingredient(
            name: "Tilapia Fish",
            image: "i_tilapiafish",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
        )

        let snapperFish = Ingredient(
            name: "Snapper Fish",
            image: "i_snapperfish",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
        )

        let chickenBroth = Ingredient(
            name: "Chicken Broth",
            image: "i_chickenbroth",
            nutrients: [protein].compactMap { $0 }
        )

        let fishBroth = Ingredient(
            name: "Fish Broth",
            image: "i_fishbroth",
            nutrients: [protein].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
        )

        let yogurt = Ingredient(
            name: "Yogurt",
            image: "i_yougurt",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let cheese = Ingredient(
            name: "Cheese",
            image: "i_cheese",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let tunaFish = Ingredient(
            name: "Tuna Fish",
            image: "i_tunafish",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
        )

        let dori = Ingredient(
            name: "Dori",
            image: "i_dori",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
        )

        let fishBalls = Ingredient(
            name: "Fish Balls",
            image: "i_fishballs",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [fishAllergen, glutenAllergen].compactMap { $0 }
        )

        let peas = Ingredient(
            name: "Peas",
            image: "i_peas",
            nutrients: [protein, carbs].compactMap { $0 },
            allergens: [soyAllergen].compactMap { $0 }
        )

        let tempeh = Ingredient(
            name: "Tempeh",
            image: "i_tempeh",
            nutrients: [protein, iron].compactMap { $0 },
            allergens: [soyAllergen].compactMap { $0 }
        )

        let mungBeans = Ingredient(
            name: "Mung Beans",
            image: "i_mungbean",
            nutrients: [protein, carbs].compactMap { $0 },
            allergens: [soyAllergen].compactMap { $0 }
        )

        let soyBeans = Ingredient(
            name: "Soy Beans",
            image: "i_soybean",
            nutrients: [protein, carbs].compactMap { $0 },
            allergens: [soyAllergen].compactMap { $0 }
        )

        let redBeans = Ingredient(
            name: "Red Beans",
            image: "i_redbean",
            nutrients: [protein, carbs].compactMap { $0 },
            allergens: [peanutAllergen].compactMap { $0 }

        )

        let peanuts = Ingredient(
            name: "Peanuts",
            image: "i_peanuts",
            nutrients: [protein, fat].compactMap { $0 },
            allergens: [peanutAllergen].compactMap { $0 }

        )

        let potato = Ingredient(
            name: "Potato",
            image: "i_potato",
            nutrients: [carbs].compactMap { $0 }
        )

        let eggNoodle = Ingredient(
            name: "Egg Noodle",
            image: "i_eggnoodle",
            nutrients: [carbs].compactMap { $0 },
            allergens: [glutenAllergen, eggAllergen].compactMap { $0 }

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
            image: "i_whiteBread",
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
            nutrients: [carbs].compactMap { $0 },
            allergens: [glutenAllergen].compactMap { $0 }

        )

        let ubi = Ingredient(
            name: "Ubi",
            image: "i_ubi",
            nutrients: [carbs].compactMap { $0 }
        )

        let coconutMilk = Ingredient(
            name: "Coconut Milk",
            image: "i_coconutMilk",
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

//        let squid = Ingredient(
//            name: "Squid",
//            image: "i_squid",
//            nutrients: [protein, zinc, micro].compactMap { $0 }
//        )

        let meat = Ingredient(
            name: "Meat",
            image: "i_buffalo",
            nutrients: [protein, iron, fat].compactMap { $0 }
        )

        let saltedFish = Ingredient(
            name: "Salted Fish",
            image: "i_saltedfish",
            nutrients: [protein, zinc].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }

        )

        let carp = Ingredient(
            name: "Carp",
            image: "i_carp",
            nutrients: [protein, fat, zinc].compactMap { $0 },
            allergens: [fishAllergen].compactMap { $0 }
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

        let chicken = Ingredient(
            name: "Chicken",
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

        let papaya = Ingredient(
            name: "Papaya",
            image: "i_papaya",
            nutrients: [micro].compactMap { $0 }
        )

        let pumpkin = Ingredient(
            name: "Pumpkin",
            image: "i_pumpkin",
            nutrients: [micro].compactMap { $0 }
        )

        let strawberry = Ingredient(
            name: "Strawberry",
            image: "i_strawberry",
            nutrients: [micro].compactMap { $0 }
        )

        let waterGourd = Ingredient(
            name: "Water Gourd",
            image: "i_watergourd",
            nutrients: [micro].compactMap { $0 }
        )

        let eggPlant = Ingredient(
            name: "Eggplant",
            image: "i_eggplant",
            nutrients: [micro].compactMap { $0 }
        )

        let corn = Ingredient(name: "Corn", image: "i_corn", nutrients: [micro, carbs].compactMap { $0 })
        let cabbage = Ingredient(name: "Cabbage", image: "i_cabbage", nutrients: [micro].compactMap { $0 })
//        let cassavaLeaves = Ingredient(name: "Cassava Leaves", image: "i_cassavaleaves", nutrients: [micro, iron].compactMap { $0 })
//        let grape = Ingredient(name: "Grape", image: "i_grape", nutrients: [carbs, micro].compactMap { $0 })
//        let langsat = Ingredient(name: "Langsat", image: "i_langsat", nutrients: [carbs, micro].compactMap { $0 })
//        let wateryRoseApples = Ingredient(name: "Watery Rose Apples", image: "i_watertroseapple", nutrients: [carbs, micro].compactMap { $0 })
        let Dates = Ingredient(name: "Dates", image: "i_dates", nutrients: [carbs, micro].compactMap { $0 })
        let pear = Ingredient(name: "Pear", image: "i_pear", nutrients: [carbs, micro].compactMap { $0 })
        let watermelon = Ingredient(name: "Watermelon", image: "i_watermelon", nutrients: [carbs, micro].compactMap { $0 })
//        let snakeFruit = Ingredient(name: "Snake Fruit", image: "i_snakefruit", nutrients: [carbs, micro].compactMap { $0 })
//        let mangosteen = Ingredient(name: "Mangosteen", image: "i_mangosteen", nutrients: [carbs, micro].compactMap { $0 })
//        let soursop = Ingredient(name: "Soursop", image: "i_soursop", nutrients: [carbs, micro].compactMap { $0 })
//        let lychee = Ingredient(name: "Lychee", image: "i_lychee", nutrients: [carbs, micro].compactMap { $0 })
//        let ambarella = Ingredient(name: "Ambarella", image: "i_ambarella", nutrients: [carbs, micro].compactMap { $0 })
        let broccoli = Ingredient(name: "Broccoli", image: "i_broccoli", nutrients: [micro, iron].compactMap { $0 })
        let spinach = Ingredient(name: "Spinach", image: "i_spinach", nutrients: [micro, iron].compactMap { $0 })
        let carrot = Ingredient(name: "Carrot", image: "i_carrot", nutrients: [micro].compactMap { $0 })
        let tomato = Ingredient(name: "Tomato", image: "i_tomato", nutrients: [micro].compactMap { $0 })
        let greenBeans = Ingredient(name: "Green Beans", image: "i_greenbeans", nutrients: [micro].compactMap { $0 })
        let mackarel = Ingredient(name: "Mackerel", image: "i_mackerel", nutrients: [protein, fat].compactMap { $0 }, allergens: [fishAllergen].compactMap { $0 })
        let orange = Ingredient(name: "Orange", image: "i_orange", nutrients: [micro].compactMap { $0 })
        let banana = Ingredient(name: "Banana", image: "i_banana", nutrients: [micro].compactMap { $0 })
        let apple = Ingredient(name: "Apple", image: "i_apple", nutrients: [micro].compactMap { $0 })

        // Create allergens


        // Create menus with egg ingredient
        let chickenLiverPorridge = FoodMenu(
            name: "Chicken Liver Porridge",
            image: "i_chickenliverporridge",
            isSaved: false,
            desc: "60 grams of rice\n30 grams of minced chicken liver\n10 grams of spinach\n7,5ml corn oil,to saute\n½ clove of garlic\n½ shallot\n½ piece of ginger\nSalt to taste (if needed)",
            ingredients: [whiteRice, chickenLiver, whiteRice, cornOil, spinach],
            allergens: [].compactMap { $0 }
        )

        let chickenLiverPorridgeWithCoconutMilk = FoodMenu(
            name: "Chicken Liver Porridge With Coconut Milk",
            image: "i_chickenliverporridgewithcoconutmilk",
            isSaved: false,
            desc: "60 grams of rice\n30 grams of minced chicken liver\n1 tbsp of grated carrot\n7,5ml coconut milk\n7,5ml coconut oil,to saute\n½ clove of garlic\n½ shallot\nWater as required\nSalt to taste (if needed)",
            ingredients: [whiteRice, chickenLiver, whiteRice, coconutMilk, coconutOil, carrot],
            allergens: [].compactMap { $0 }
        )

        let steamedChickenLiverPorridgeinBananaLeaf = FoodMenu(
            name: "Steamed Chicken Liver Porridge in Banana Leaf",
            image: "i_steamedchickenliverporridgeinbananaleaf",
            isSaved: false,
            desc: "60 grams of rice\n40 grams of minced chicken liver\n1 tbsp of grated carrot\n7,5ml coconut milk\n10 grams of tomato\n1 lime leaf\n1 bay leaf\nBasil leaves as needed\n½ clove of garlic\n½ shallot\n⅓cm of ginger\nTurmeric, galangal, and lemongrass as needed\nSalt and Sugar to taste (if needed)",
            ingredients: [whiteRice, chickenLiver, tomato, whiteRice, tomato, carrot, coconutMilk],
            allergens: [].compactMap { $0 }
        )

        let quailEggandChickenLiverPorridge = FoodMenu(
            name: "Quail Egg & Chicken Liver Porridge",
            image: "i_quaileggandchickenliverporridge",
            isSaved: false,
            desc: "60 grams of rice\n5 quail eggs, chopped into small pieces\n15 grams of chicken liver, finely chopped\n15 grams of green beans, chopped into small pieces\n7.5 ml of corn oil, for sautéing\nSalt to taste (if needed)\n1 garlic clove\n1 shallot",
            ingredients: [whiteRice, quail, chickenLiver, greenBeans, cornOil],
            allergens: [eggAllergen].compactMap { $0 }
        )

        let steamedLongJawedMackerelPorridgeinBananaLeaf = FoodMenu(
            name: "Steamed Long Jawed Mackerel in Banana Leaf",
            image: "i_steamedlongjawedmackerelporridgeinbananaleaf",
            isSaved: false,
            desc: "60 grams of rice\n60 grams of mackerel fish\n1 kaffir lime leaf\n1 bay leaf\n7.5 ml of corn oil\n½ tomato, chopped into small pieces\nBasil leaves to taste\nLime to taste\nBanana leaf for wrapping\nSalt to taste (if needed)\n1 shallot\n½ garlic clove\n⅓ cm ginger\n1 stalk lemongrass",
            ingredients: [whiteRice, longJawedMackerel, cornOil, tomato],
            allergens: [fishAllergen].compactMap { $0 }
        )
        let potatoandChickenliverPorridge = FoodMenu(
            name: "Potato and Chicken Liver Porridge",
            image: "i_potatoandchickenliverporridge",
            isSaved: false,
            desc: "150 grams of potatoes\n60 grams of chicken liver, finely chopped\n1.5 tbsp of grated carrots\n50 ml of UHT milk\n½ tbsp of sweet soy sauce\n7.5 ml of vegetable oil, for sautéing\nPepper to taste\nSalt to taste (if needed)\n1 garlic clove\n1 shallot",
            ingredients: [ricePorridge, potato, chickenLiver, carrot],
            allergens: [dairyAllergen, soyAllergen].compactMap { $0 }
        )
        let chickenBreastandLiverPorridge = FoodMenu(
            name: "Chicken Breast & Liver Porridge",
            image: "i_chickenbreastandliverporridge",
            isSaved: false,
            desc: "30 grams of rice\n30 grams of ground chicken breast\n30 grams of chicken liver, finely chopped\n10 grams of broccoli, finely chopped\n60 ml of chicken broth\n120 ml of water\n15 grams of tofu, finely chopped\n7.5 ml of canola oil for sautéing\nSalt to taste (if needed)\nSeasoning paste: 1 clove of garlic, 1 shallot, 1 small piece of ginger",
            ingredients: [chicken, chickenLiver, tofu, broccoli, chickenBroth, canolaOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let chickenButterPorridge = FoodMenu(
            name: "Chicken Butter Porridge",
            image: "i_chickenbutterporridge",
            isSaved: false,
            desc: "30 grams of rice\n30 grams of ground chicken\n1 egg\n1.5 tbsp of grated carrot\n300 ml of chicken broth\n1.5 tbsp of butter for sautéing\nSalt to taste (if needed)\nSeasoning paste: 1 shallot, 1 clove of garlic",
            ingredients: [chicken, egg, carrot, chickenBroth, butter],
            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
        )

        let chickenCurryPorridge = FoodMenu(
            name: "Chicken Curry Porridge",
            image: "i_chickencurryporridge",
            isSaved: false,
            desc: "60 grams of rice\n60 grams of minced chicken\n15 grams of coconut milk\n1.5 tbsp of grated carrots\n1 bay leaf\n1 kaffir lime leaf\n30 ml of water\n2.5 ml of corn oil, for sautéing\nSalt to taste (if needed)\n1 garlic clove\n1 shallot\n1 piece of ginger\n1 candlenut\nCoriander to taste",
            ingredients: [whiteRice, chicken, coconutMilk, carrot, cornOil, candlenut],
            allergens: [eggAllergen].compactMap { $0 }
        )

        let mackerelPorridge = FoodMenu(
            name: "Mackerel Porridge",
            image: "i_mackerelporridge",
            isSaved: false,
            desc: "30 grams of rice, steamed halfway\n45 grams of mackerel, finely chopped\n15 grams of green beans, finely chopped\n150 ml of chicken broth\n7.5 ml of coconut oil for sautéing\nSalt to taste (if needed)\nSeasoning paste: 1 clove of garlic, 1 shallot",
            ingredients: [mackarel, greenBeans, chickenBroth, coconutOil],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let beefandEggPorridge = FoodMenu(
            name: "Beef & Egg Porridge",
            image: "i_beefandeggporridge",
            isSaved: false,
            desc: "60 grams of rice\n60 grams of minced beef\n½ egg, beaten\n3 florets of broccoli, finely chopped\n50 ml of water\nSeasoning paste: 1 clove of garlic, 1 shallot, 1/2 tsp of soy sauce, 1/2 tsp of sesame oil, 1 tsp of butter, pepper to taste, salt to taste (if needed)",
            ingredients: [whiteRice, mincedBeef, egg, broccoli, sesameOil, butter],
            allergens: [soyAllergen, eggAllergen, dairyAllergen].compactMap { $0 }
        )

        let shrimpTofuPorridge = FoodMenu(
            name: "Shrimp Tofu Porridge",
            image: "i_shrimptofuporridge",
            isSaved: false,
            desc: "60 grams of rice\n45 grams of ground shrimp\n20 grams of tofu,cut into small pieces\n10 grams of tomato, cut into small pieces\nBasil leaves, bay leaves, and lime to taste\nSalt and Sugar to taste (if needed)\n½ clove of garlic\n1 shallot\n1 candlenut\n⅓cm of ginger",
            ingredients: [whiteRice, shrimp, coconutMilk, tofu, tomato, candlenut],
            allergens: [soyAllergen, shellfishAllergen].compactMap { $0 }
        )

        let shrimpGreenbeansPorridge = FoodMenu(
            name: "Shrimp Green Beans Porridge",
            image: "i_shrimpgreenbeansporridge",
            isSaved: false,
            desc: "60 grams of rice\n40 grams of ground shrimp\n10 grams of green beans, cut into small pieces\n7.5 ml of corn oil, for sautéing\nLime to taste\nBasil leaves, bay leaves to taste\n½ clove of garlic\n½ shallot\nSalt to taste (if needed)",
            ingredients: [whiteRice, shrimp, greenBeans, cornOil],
            allergens: [soyAllergen, shellfishAllergen].compactMap { $0 }
        )

        let shrimpandCoconutMilkPorridge = FoodMenu(
            name: "Shrimp & Coconut Milk Porridge",
            image: "i_shrimpandcoconutmilkporridge",
            isSaved: false,
            desc: "90 grams of rice\n90 grams of shrimp, finely chopped\n100 ml of coconut milk\n1.5 tbsp of grated carrots\n1 bay leaf\n7.5 ml of coconut oil, for sautéing\nGinger to taste\nLemongrass to taste\nSalt to taste (if needed)\n1 garlic clove\n1 shallot",
            ingredients: [whiteRice, shrimp, coconutMilk, carrot, coconutOil],
            allergens: [shellfishAllergen, dairyAllergen].compactMap { $0 }
        )

        let chickenandShrimpDumplings = FoodMenu(
            name: "Chicken & Shrimp Dumplings",
            image: "i_chickenandshrimpdumplings",
            isSaved: false,
            desc: "125 grams of minced chicken\n30 grams of minced shrimp, finely chopped\n10 sheets of dumpling skin\n50 grams of tapioka\n½ tbsp sesameOil\n½ tbsp soy sauce\n½ tbsp oyster sauce\n15 grams of gratted carrot\n1/4 jicama\n1 leek\n7.5ml soyOil\nsalt and sugar (if needed)\n 1 clove of garlic\n1 shallot",
            ingredients: [chicken, shrimp, sesameOil, carrot, soybeanOil],
            allergens: [shellfishAllergen].compactMap { $0 }
        )

        let catfishPorridge = FoodMenu(
            name: "Catfish Porridge",
            image: "i_catfishporridge",
            isSaved: false,
            desc: "60 grams of rice\n30 grams of chicken liver, finely chopped\n30 grams of catfish, finely chopped\n10 grams of tomato, cut into small pieces\n7.5 ml of corn oil\n3 slices of onion\n⅓ cm of ginger\n1 bay leaf\n1 kaffir lime leaf\nCelery to taste\nSalt to taste (if needed)\nWater to taste\nLime\n\nFor the paste: \n½ clove of garlic\n½ shallot",
            ingredients: [whiteRice, chickenLiver, catfish, tomato, cornOil],
            allergens: [fishAllergen, shellfishAllergen].compactMap { $0 }
        )

        // belum : gambar
        let tofuandCatfishPorridge = FoodMenu(
            name: "Tofu & Catfish Porridge",
            image: "i_tofuandcatfishporridge",
            isSaved: false,
            desc: "90 grams of rice\n30 grams of catfish\n30 grams of tofu\n10 grams of broccoli, chopped into small pieces\n1 chicken egg\n15 grams of tomato, chopped into small pieces\n7.5 ml of coconut oil, for sautéing\nBasil leaves to taste\nSalt to taste (if needed)\nBanana leaf\n1 garlic clove\n1 shallot\n½ onion, chopped",
            ingredients: [whiteRice, catfish, tofu, broccoli, egg, tomato, coconutOil],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let beefPorridge = FoodMenu(
            name: "Beef Porridge",
            image: "i_beefporridge",
            isSaved: false,
            desc: "60 grams of rice\n50 grams of ground beef\n15 grams of spinach, boiled, and finely chopped\n7.5 ml of coconut oil\nSalt to taste (if needed)\n1 shallot\n1 clove of garlic",
            ingredients: [mincedBeef, coconutOil, spinach],
            allergens: [].compactMap { $0 }
        )

        let beefLiverPorridge = FoodMenu(
            name: "Beef Liver Porridge",
            image: "i_beefliverporridge",
            isSaved: false,
            desc: "90 grams of rice\n60 grams of beef liver, finely chopped\n1 piece of ginger, smashed\n15 grams of spinach, finely chopped\n150 ml of coconut milk\n7.5 ml of vegetable oil, for sautéing\nLemongrass to taste\nSalt to taste (if needed)\n1 garlic clove\n1 shallot",
            ingredients: [whiteRice, beefLiver, spinach, coconutMilk],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let tialpiafishPorridge = FoodMenu(
            name: "Tilapia Fish Porridge",
            image: "i_tilapiafishporridge",
            isSaved: false,
            desc: "60 grams of rice\n60 grams of tilapia fish, diced\n15 grams of chicken liver, diced\n1.5 tbsp of grated carrots\n1 bay leaf\n1 kaffir lime leaf\n7.5 ml of canola oil\nSpring onions to taste\nSalt to taste (if needed)\n1 garlic clove\n1 shallot",
            ingredients: [whiteRice, tilapiaFish, chickenLiver, carrot, canolaOil],
            allergens: [fishAllergen, eggAllergen].compactMap { $0 }
        )

        let snapperfishPorridge = FoodMenu(
            name: "Snapper Fish Porridge",
            image: "i_snapperfishporridge",
            isSaved: false,
            desc: "60 grams of rice\n45 grams of snapper fish, finely chopped\n15 grams of tempeh\n15 grams of tomato, chopped into small pieces\n250 ml of fish broth\n7.5 ml of soy oil\nSalt to taste (if needed)\n1 garlic clove\n1 shallot",
            ingredients: [whiteRice, snapperFish, tempeh, tomato, fishBroth, soybeanOil],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let orangeandAvocadoPure = FoodMenu(
            name: "Orange & Avocado Pure",
            image: "i_orangeandavocadopure",
            isSaved: false,
            desc: "30 grams of avocado\n20 grams of orange",
            ingredients: [avocado, orange],
            allergens: [].compactMap { $0 }
        )

        let appleandBananaPure = FoodMenu(
            name: "Apple & Banana Pure",
            image: "i_appleandbananapure",
            isSaved: false,
            desc: "50 grams of apple\n50 grams of banana\n2tbsp of yoghurt",
            ingredients: [apple, banana, yogurt],
            allergens: [].compactMap { $0 }
        )

        let vanillaMilkPudding = FoodMenu(
            name: "Vanilla Milk Pudding",
            image: "i_vanillamilkpudding",
            isSaved: false,
            desc: "60 grams of eggyolk\n800 ml of milk\n100 grams of sugar\n½ tsp of vanilla paste\n1 pack of jelly powder\n1/2 tsp of salt (if needed)",
            ingredients: [eggYolk, jellyPowder],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let cheeseBreadSteam = FoodMenu(
            name: "Cheese Bread Steam",
            image: "i_cheesebreadsteam",
            isSaved: false,
            desc: "2 slices of white bread\n125 ml of milk\n½ egg\n50 grams of grated cheese\n1½ tsp of melted butter\nvanilli powder (if needed)",
            ingredients: [whiteBread, egg, cheese, butter],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let cheeseMacaroni = FoodMenu(
            name: "Cheese Macaroni",
            image: "i_cheesemacaroni",
            isSaved: false,
            desc: "150 grams of macaroni\n60 grams of minced beef\n1½ egg\n1 tbsp of grated cheese\n7.5 ml coconut oil\nsalt (if needed)\n1 clove of garlic\n½ onion",
            ingredients: [macaroni, mincedBeef, egg, cheese, coconutOil],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let tunaandCarrotSteam = FoodMenu(
            name: "Tuna & Carrot Steam",
            image: "i_tunaandcarrotsteam",
            isSaved: false,
            desc: "90 grams of rice\n90 grams of tuna, cut into small pieces\n1 1/2 tbsp grated carrot\n1 stalk of green onion\n1 slice of ginger\n5 ml corn oil (for sautéing)\nSalt to taste (if needed)\n1 garlic clove (mashed)\n1 shallot",
            ingredients: [tunaFish, whiteRice, carrot, cornOil],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let beefSotoSteam = FoodMenu(
            name: "Beef Soto Steam",
            image: "i_beefsotosteam",
            isSaved: false,
            desc: "75 grams of steamed rice\n50 grams of beef, cut into small pieces\n1/2 boiled egg\n1 stalk of lemongrass\n1 stalk of green onion, cut into small pieces\n2 kaffir lime leaves\n1 tsp salt (if needed)\n1 tsp sugar (if needed)\n300 ml water for boiling\n7.5 ml corn oil (for sautéing)\n1 large tomato, thinly sliced\nFried shallots to taste\n3 shallots\n2 garlic cloves\n1/2 candlenut\n1/2 tsp coriander\nTurmeric and ginger to taste",
            ingredients: [mincedBeef, meat, whiteRice, egg, tomato, candlenut],
            allergens: [eggAllergen].compactMap { $0 }
        )

        let doriPotatoCheese = FoodMenu(
            name: "Dori Potato with Cheese Sauce",
            image: "i_doripotatocheese",
            isSaved: false,
            desc: "50 grams of dori fish\n150 grams of potato\n40 grams of grated cheese\nBreadcrumbs to taste\nCHEESE SAUCE:\n40 ml UHT full cream milk\n50 ml water for boiling\n1 egg yolk\n2 tbsp cornstarch\nGrated cheese to taste",
            ingredients: [dori, potato, cheese, egg],
            allergens: [fishAllergen, dairyAllergen, eggAllergen, glutenAllergen].compactMap { $0 }
        )

        let yellowSteamedRiceChickenLiverStew = FoodMenu(
            name: "Yellow Steamed Rice with Chicken Liver Stew",
            image: "i_yellowricechickenliver",
            isSaved: false,
            desc: "YELLOW RICE:\n60 grams of rice\n200 ml water\n1 1/2 tbsp grated carrot\n20 grams of tempeh, cut into small pieces\n1 tsp turmeric powder\n2 bay leaves\n1 shallot (mashed)\n1 stalk of green onion, cut into small pieces\n1 stalk of celery, cut into small pieces\nCHICKEN LIVER STEW:\n40 grams of chicken liver, cut into small pieces\n1 garlic clove (mashed)\nTomato (mashed)\n1/4 tsp turmeric powder\n1 tsp sweet soy sauce\n10 ml corn oil (for sautéing)\nSalt and sugar to taste (if needed)",
            ingredients: [whiteRice, carrot, tempeh, chickenLiver, tomato, cornOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let beefTempehStew = FoodMenu(
            name: "Beef and Tempeh Stew",
            image: "i_beeftempestew",
            isSaved: false,
            desc: "75 grams of rice\n60 grams of beef, diced\n20 grams of tempeh, cut into small pieces\n7.5 ml corn oil\n20 grams of tomato\nLime juice\n1/4 tsp sweet soy sauce\n1/4 tsp salt\n1 shallot\n1/2 garlic clove",
            ingredients: [mincedBeef, meat, whiteRice, tempeh, cornOil, tomato],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let steamedChickenRice = FoodMenu(
            name: "Steamed Chicken Rice",
            image: "i_steamedchickenrice",
            isSaved: false,
            desc: "60 grams of rice\n75 grams of ground chicken\n150 ml light coconut milk\n50 ml chicken broth\n1 bay leaf\n1 long bean, cut into small pieces\n1/2 tbsp corn oil\n7.5 ml soybean oil\nSalt and sugar to taste\n1 garlic clove",
            ingredients: [whiteRice, chicken, coconutMilk, chickenBroth, cornOil, soybeanOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let broccoliShrimpSteamed = FoodMenu(
            name: "Broccoli and Shrimp Steamed",
            image: "i_broccolishrimpsteamed",
            isSaved: false,
            desc: "60 grams of rice\n200 ml chicken broth\n1 tsp salt\n1/4 tsp sugar\n50 grams of ground shrimp\n15 grams of broccoli, cut into small pieces\n1 tsp corn oil\n5 ml coconut oil (for sautéing)\n1 garlic clove\n1 shallot",
            ingredients: [whiteRice, chickenBroth, shrimp, broccoli, cornOil, coconutOil],
            allergens: [shellfishAllergen].compactMap { $0 }
        )

        let beefLiverSambalSteamed = FoodMenu(
            name: "Beef Liver Sambal Steamed",
            image: "i_beefliversambalsteamed",
            isSaved: false,
            desc: "20 grams of rice\n20 grams of beef liver\n30 ml of thin coconut milk\n20 grams of potato, diced\n10 grams of tomato, diced\n1 bay leaf\n1 kaffir lime leaf\n1 lemongrass stalk\n½ cm of galangal\n½ cm of ginger\n5 ml of soybean oil (for sautéing)\nSugar and salt to taste\n\nBLENDED SPICES:\n1 shallot\n1 clove of garlic\n1 candlenut",
            ingredients: [beefLiver, coconutMilk, potato, tomato, soybeanOil, candlenut],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let beefSteamed = FoodMenu(
            name: "Beef Steamed",
            image: "i_beefsteamed",
            isSaved: false,
            desc: "60 grams of rice\n75 grams of minced beef\n150 ml of chicken stock\n1 tablespoon of carrot, diced\n1 tablespoon of vegetable oil (for sautéing)\n1 teaspoon of sesame oil\n2 tablespoons of sweet soy sauce\n1 teaspoon of ground pepper\n1 teaspoon of salt\n\nBLENDED SPICES:\n1 clove of garlic",
            ingredients: [whiteRice, mincedBeef, chickenBroth, carrot, sesameOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let steamedSoySauceChicken = FoodMenu(
            name: "Steamed Soy Sauce Chicken",
            image: "i_steamedsoysaucechicken",
            isSaved: false,
            desc: "60 grams of rice\n300 ml of chicken stock\n100 grams of boiled chicken, diced\n1½ tablespoons of grated carrot\n2 tablespoons of sweet soy sauce\n1 tablespoon of corn oil (for sautéing)\nPepper and salt to taste\n\nBLENDED SPICES:\n1 clove of garlic\n1 shallot",
            ingredients: [whiteRice, chickenBroth, chicken, carrot, cornOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let steamedMackerelStirFry = FoodMenu(
            name: "Steamed Mackerel Stir Fry",
            image: "i_steamedmackerelstirfry",
            isSaved: false,
            desc: "60 grams of rice\n100 grams of mackerel, diced\n30 grams of broccoli, chopped\n1 teaspoon of sweet soy sauce\n1 teaspoon of oyster sauce\n300 ml of chicken stock\n10 ml of corn oil (for sautéing)\n1 teaspoon of sesame oil (for sautéing)\nSalt and lime to taste\n\nBLENDED SPICES:\n1 shallot\n1 clove of garlic\n4 cm of ginger",
            ingredients: [whiteRice, mackarel, broccoli, chickenBroth, cornOil, sesameOil],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let steamedRiceChickenMushroom = FoodMenu(
            name: "Steamed Rice Chicken Mushroom",
            image: "i_steamedricechickenmushroom",
            isSaved: false,
            desc: "120 grams of rice\n60 grams of chicken, diced\n20 grams of straw mushrooms, sliced\n1½ tablespoons of grated carrot\n1 teaspoon of sesame oil\n1 teaspoon of sweet soy sauce\n½ teaspoon of soy sauce\n100 ml of chicken stock\n10 ml of palm oil (for sautéing)\n\nBLENDED SPICES:\n1 shallot\n1 clove of garlic\n½ cm of ginger\nSalt and pepper to taste",
            ingredients: [whiteRice, chicken, blackJellyMushroom, carrot, sesameOil, chickenBroth],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let tunaSteam = FoodMenu(
            name: "Tuna Steam",
            image: "i_tunasteam",
            isSaved: false,
            desc: "90 grams of tuna, diced\n50 grams of rice\n1 teaspoon of salt\n1 kaffir lime leaf\n300 ml of thin coconut milk\n1 tablespoon of corn oil (for sautéing)\nLime and salt to taste\n\nBLENDED SPICES:\n1 shallot\n1 clove of garlic\n1 cm of turmeric\n½ candlenut",
            ingredients: [tunaFish, whiteRice, coconutMilk, cornOil, candlenut],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let potatoBeefSteam = FoodMenu(
            name: "Potato Beef Steam",
            image: "i_potatobeefsteam",
            isSaved: false,
            desc: "200 grams of potatoes, diced\n60 grams of broccoli, coarsely chopped\n60 grams of ground beef\n4 tsp of salt\n10 ml of corn oil (for sautéing)\nSeasoning:\n1 clove of garlic\n½ shallot\n",
            ingredients: [potato, broccoli, mincedBeef, cornOil],
            allergens: [].compactMap { $0 }
        )

        let riceBall = FoodMenu(
            name: "Rice Ball",
            image: "i_riceball",
            isSaved: false,
            desc: "75 grams of rice50 grams of ground chicken\n20 grams of tofu, mashed\n1 egg, beaten\n2 tbsp cornstarch\n1½ tbsp grated carrot\nBreadcrumbs as needed\nSoybean oil for frying\nSeasoning:\n1 clove of garlic\n1 shallot\n1 spring onion\nSalt to taste",
            ingredients: [whiteRice, chicken, tofu, egg, carrot, soybeanOil],
            allergens: [soyAllergen, eggAllergen].compactMap { $0 }
        )

        let steamedGuremeRice = FoodMenu(
            name: "Steamed Gureme Rice",
            image: "i_steamedguremerice",
            isSaved: false,
            desc: "100 grams of rice\n 60 grams of gourami fish, minced\n1½ tbsp grated carrot\n4 tomatoes, diced small\n12.5 ml canola oil\nSalt to taste\nCelery leaves, thinly sliced\nSeasoning:\n1 clove of garlic\n1 shallot\n",
            ingredients: [whiteRice, carp, carrot, tomato, canolaOil],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let steamChickenStew = FoodMenu(
            name: "Steam Chicken Stew",
            image: "i_steamchickenstew",
            isSaved: false,
            desc: "90 grams of rice\n60 grams of minced chicken\n30 grams of tofu, minced\n1½ tbsp grated carrot\n2 tbsp sweet soy sauce\n75 ml chicken broth\n10 ml corn oil (for sautéing)\nSalt to taste\nSeasoning:\n1 shallot\n1 clove of garlic\n",
            ingredients: [whiteRice, chicken, tofu, carrot, chickenBroth, cornOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let potatoEggSteam = FoodMenu(
            name: "Potato Egg Steam",
            image: "i_potatoeggsteam",
            isSaved: false,
            desc: "150 grams of boiled potatoes, mashed\n50 grams of minced chicken, boiled\n1½ tbsp grated carrot\n1 egg, beaten\n10 grams of margarine\nSalt to taste\n",
            ingredients: [potato, chicken, carrot, egg],
            allergens: [eggAllergen].compactMap { $0 }
        )

        let chickenNoodleSteam = FoodMenu(
            name: "Chicken Noodle Steam",
            image: "i_chickennoodlesteam",
            isSaved: false,
            desc: "150 grams of egg noodles, boiled until cooked\n75 grams of minced chicken\n1 egg, beaten\n200 ml chicken broth\n1 tsp soy sauce\n1 tsp sweet soy sauce\n30 grams of mustard greens, chopped small\n10 ml canola oil\nCelery leaves, finely chopped\nSeasoning:\n1 shallot\n1 clove of garlic\n",
            ingredients: [eggNoodle, chicken, egg, chickenBroth, canolaOil],
            allergens: [soyAllergen, eggAllergen].compactMap { $0 }
        )

        let macaroniSteam = FoodMenu(
            name: "Macaroni Steam",
            image: "i_macaronisteam",
            isSaved: false,
            desc: "50 grams of macaroni (uncooked), boiled until soft\n60 grams of minced chicken\n30 grams of broccoli, finely chopped\n1 tbsp chopped onion\n50 ml cow’s milk\n10 ml canola oil (for sautéing)\nGrated cheese to taste\nSalt to taste\nSeasoning:\n1 shallot\n1 clove of garlic\n",
            ingredients: [macaroni, chicken, broccoli, canolaOil, cheese],
            allergens: [dairyAllergen, glutenAllergen].compactMap { $0 }
        )

        let chocolateMilkPudding = FoodMenu(
            name: "Chocolate Milk Pudding",
            image: "i_chocolatemilkpudding",
            isSaved: false,
            desc: "1 package of agar-agar chocolate\n1100 ml of liquid milk\n3 tablespoons of sugar\n100 grams of melted dark cooking chocolate\n4 teaspoons of cornstarch\n6 tablespoons of water\n3 tablespoons of sugar\n250 ml of liquid milk\n1 teaspoon of vanilla extract",
            ingredients: [jellyPowder],
            allergens: [dairyAllergen, eggAllergen].compactMap { $0 }
        )

        let mackerelBalls = FoodMenu(
            name: "Mackerel Balls",
            image: "i_mackerelballs",
            isSaved: false,
            desc: "30 grams of mackerel fish\n1 egg\n2 slices of bread\nThinly sliced spring onions\nOat flour as needed\nGrated cheese as needed\nSalt as needed\nCorn oil for frying",
            ingredients: [mackarel, egg, whiteBread, oatFlour, cheese, cornOil],
            allergens: [eggAllergen, glutenAllergen, dairyAllergen].compactMap { $0 }
        )

        let bitterballen = FoodMenu(
            name: "Bitterballen",
            image: "i_bitterballen",
            isSaved: false,
            desc: "100 grams of ground beef\n30 grams of wheat flour\n300 ml of milk\n1 carrot, grated\n1 egg, beaten\n2 tablespoons of margarine for sautéing\nPepper to taste\nSalt to taste\nGrated cheese as needed\nCheese cut into small cubes\nBreadcrumbs as needed\n1 clove of garlic",
            ingredients: [mincedBeef, flour, carrot, egg, cheese],
            allergens: [glutenAllergen, dairyAllergen, eggAllergen].compactMap { $0 }
        )

        let chickenLemper = FoodMenu(
            name: "Chicken Lemper",
            image: "i_chickenlemper",
            isSaved: false,
            desc: "100 grams of cooked sticky rice\n75 ml of coconut milk\n75 grams of chopped chicken\n2 kaffir lime leaves\n1 bay leaf\n½ stalk of lemongrass, bruised\n10 ml of corn oil for sautéing\nSalt to taste\nSugar to taste\nBanana leaves for wrapping\n2 cloves of garlic\n2 shallots\n1 roasted candlenut\nCoriander to taste",
            ingredients: [glutinousRice, coconutMilk, chicken, cornOil, candlenut],
            allergens: [dairyAllergen, eggAllergen].compactMap { $0 }
        )

        let cheesePotatoBalls = FoodMenu(
            name: "Cheese Potato Balls",
            image: "i_cheesepotatoballs",
            isSaved: false,
            desc: "350 grams of potatoes, boiled with salt and mashed\n150 grams of wheat flour\n2 eggs, beaten\n½ teaspoon of sugar\n50 grams of cheese, diced\nBreadcrumbs as needed\nCorn oil for frying",
            ingredients: [potato, flour, egg, cheese, cornOil],
            allergens: [glutenAllergen, dairyAllergen, eggAllergen].compactMap { $0 }
        )

        let fruitJelly = FoodMenu(
            name: "Fruit Jelly",
            image: "i_fruitjelly",
            isSaved: false,
            desc: "1 package of white agar-agar\n750 ml of water\n30 grams of papaya, cut into small pieces\n30 grams of melon, cut into small pieces\n30 grams of watermelon, cut into small pieces",
            ingredients: [jellyPowder, watermelon],
            allergens: [].compactMap { $0 }
        )

        let chickenKatsuRice = FoodMenu(
            name: "Chicken Katsu Rice",
            image: "i_chickenkatsurice",
            isSaved: false,
            desc: "200 grams of rice\n100 grams of chicken fillet\n20 grams of carrot\n20 grams of green beans\n1/2 beaten egg\n1 lime\nBreadcrumbs as needed\nSalt to taste\nPepper to taste\nOil for frying",
            ingredients: [chicken, egg, carrot, greenBeans],
            allergens: [glutenAllergen, eggAllergen].compactMap { $0 }
        )

        let beefGadonRice = FoodMenu(
            name: "Beef Gadon with Rice",
            image: "i_beefgadonrice",
            isSaved: false,
            desc: "100 grams of minced beef\n60 ml of coconut milk\n1/2 beaten egg\n1/2 tsp palm sugar\n3 kaffir lime leaves\n3 bay leaves\nSalt to taste\n\nSpice Paste:\n2 shallots\n1 clove of garlic\n1 candlenut (roasted)\nCoriander to taste\nPepper to taste",
            ingredients: [mincedBeef, coconutMilk, egg, candlenut],
            allergens: [soyAllergen, eggAllergen, treenutAllergen].compactMap { $0 }
        )

        let beefStirFryRice = FoodMenu(
            name: "Rice with Beef Stir-Fry in Sauce",
            image: "i_beefstirfryrice",
            isSaved: false,
            desc: "100 grams of beef (cut into small pieces and boiled)\n1/2 tomato\n1/4 onion (sliced)\n\nComplementary Seasoning:\n1/2 tsp sugar\nOyster sauce to taste\nSweet soy sauce to taste\n\nRoughly Ground Seasoning:\n1 clove of garlic\n1 shallot\n1/4 cm of ginger",
            ingredients: [mincedBeef, tomato],
            allergens: [soyAllergen, glutenAllergen].compactMap { $0 }
        )

        let braisedDuckRice = FoodMenu(
            name: "Rice with Braised Duck",
            image: "i_braisedduckrice",
            isSaved: false,
            desc: "100 grams of young duck (cut into small pieces)\n125 ml of water\n1 tbsp of oil\n1 tbsp sweet soy sauce\n1 tbsp soy sauce\n1/2 tbsp spring onion (thinly sliced)\n1/2 tbsp sesame oil\n10 ml corn oil for stir-frying\n\nSpice Paste:\n1/2 tbsp sliced garlic\n1/2 tsp pepper\nSalt to taste",
            ingredients: [duck, sesameOil, cornOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let riceWithButterFriedDuck = FoodMenu(
            name: "Rice with Butter-Fried Duck",
            image: "i_ricewithbutterfriedduck",
            isSaved: false,
            desc: "100 grams of duck meat, cut into small pieces\n1/4 tsp grated ginger\n1/2 tsp salt\n150 grams of rice\n1/4 tomato\n1 tbsp butter\n1/2 tbsp minced garlic\n1/4 onion, diced\n20 ml water\n1/2 tsp pepper\n3 tsp sweet soy sauce\n10 ml coconut oil (for frying)\nSoy sauce to taste\nSesame oil to taste",
            ingredients: [duck, whiteRice, tomato, butter, sesameOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let stirFriedNoodlesStreetStyle = FoodMenu(
            name: "Stir-Fried Noodles Street-Style",
            image: "i_stirfriednoodles",
            isSaved: false,
            desc: "150 grams egg noodles (pre-boiled until soft)\n100 grams of chicken (boiled and cut into small pieces)\n30 grams mustard greens, coarsely chopped\n1 fried egg\n2 tbsp sweet soy sauce\n1 tbsp soy sauce\n15 ml coconut oil (for frying)\nSalt to taste\nSugar to taste\nPepper to taste\nSpring onions to taste, thinly sliced\nGROUND SPICES:\n2 cloves garlic\n2 shallots\n2 candlenuts (roasted)",
            ingredients: [eggNoodle, chicken, egg, candlenut],
            allergens: [soyAllergen, eggAllergen, treenutAllergen].compactMap { $0 }
        )

        let shrimpFriedRice = FoodMenu(
            name: "Shrimp Fried Rice",
            image: "i_shrimpfriedrice",
            isSaved: false,
            desc: "150 grams of rice\n100 grams of shrimp (peeled)\n1/2 tsp cornstarch\n1 egg (beaten)\n30 grams peas\n15 ml corn oil (for frying)\nSpring onions to taste, thinly sliced\nSalt to taste\nGROUND SPICES:\n2 cloves garlic\n1 shallot",
            ingredients: [whiteRice, shrimp, egg, peas],
            allergens: [shellfishAllergen, eggAllergen].compactMap { $0 }
        )

        let savoryRiceWithStirFriedFishBallsAndBroccoli = FoodMenu(
            name: "Savory Rice with Stir-Fried Fish Balls and Broccoli",
            image: "i_savoryricefishballsbroccoli",
            isSaved: false,
            desc: "100 grams of rice\n100 ml thin coconut milk\n1 bay leaf\n1 stalk lemongrass (bruised)\nSTIR-FRY:\n150 grams fish balls (cut into small pieces)\n1.5 tbsp carrots (diced)\n30 grams broccoli (cut into small pieces)\n1 tbsp cornstarch\n1/2 tbsp oyster sauce\n1 clove garlic (thinly sliced)\n1 shallot (thinly sliced)\n1 stalk spring onion (coarsely chopped)\n2 tbsp soybean oil (for frying)\nPepper to taste",
            ingredients: [whiteRice, coconutMilk, fishBalls, carrot, broccoli],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let riceChickenMushroom = FoodMenu(
            name: "Rice with Chicken and Mushrooms",
            image: "i_ricechickenmushroom",
            isSaved: false,
            desc: "150 grams of rice\n100 grams of minced chicken\n1 1/2 tbsp boiled carrots\n15 grams of boiled broccoli\n15 grams of thinly sliced button mushrooms\n1 1/2 tbsp sweet soy sauce\n1 tbsp soy sauce\n10 ml corn oil\nSalt to taste\n2 cloves of garlic\n1 shallot",
            ingredients: [whiteRice, chicken, carrot, broccoli, blackJellyMushroom, cornOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let chickenSoup = FoodMenu(
            name: "Chicken Soup",
            image: "i_chickensoup",
            isSaved: false,
            desc: "150 grams of rice\n100 grams of shredded boiled chicken breast\n750 ml chicken stock\n30 grams of sweet corn kernels\n1/2 carrot, diced\n1 stalk of green onion, chopped\n1/4 tomato, diced\n2 tbsp margarine\nSalt, pepper, nutmeg, and celery to taste",
            ingredients: [whiteRice, chicken, carrot, tomato, butter],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let stirFriedTofuShrimp = FoodMenu(
            name: "Stir-Fried Tofu and Shrimp",
            image: "i_stirfriedtofushrimp",
            isSaved: false,
            desc: "150 grams of rice\n75 grams of shrimp\n200 grams of silken tofu, diced\n2 pieces of cloud ear mushrooms, sliced\n1 egg, beaten\n1 1/2 tbsp grated carrot\n1/2 tbsp fish sauce\n1 tsp sesame oil\n1 stalk of green onion, chopped\n30 ml water\n1 tbsp cornstarch\n15 ml soybean oil\nSalt to taste\n1/2 onion\n1 clove of garlic",
            ingredients: [whiteRice, shrimp, tofu, blackJellyMushroom, egg, carrot, sesameOil, soybeanOil],
            allergens: [soyAllergen, shellfishAllergen, eggAllergen].compactMap { $0 }
        )

        let mixedEggRice = FoodMenu(
            name: "Mixed Egg Rice",
            image: "i_mixedeggrice",
            isSaved: false,
            desc: "200 grams of rice\n3 eggs, beaten\n1 stalk of green onion, thinly sliced\n4 onions, coarsely chopped\n15 grams of finely chopped carrot\n30 grams of cooked ground chicken\n3 tbsp corn oil\nSalt and pepper to taste\n2 cloves of garlic\n1 shallot",
            ingredients: [whiteRice, egg, carrot, chicken, cornOil],
            allergens: [eggAllergen].compactMap { $0 }
        )

        let friedNoodlesQuailEggs = FoodMenu(
            name: "Fried Noodles with Quail Eggs",
            image: "i_friednoodlesquaileggs",
            isSaved: false,
            desc: "300 grams of egg noodles, boiled\n10 boiled quail eggs\n50 grams of peeled shrimp\n1 stalk of Chinese mustard greens, sliced\n1/2 tbsp diced carrot\n3 tbsp sweet soy sauce\n1/2 tbsp soy sauce\n15 ml corn oil\nOyster sauce, salt, and pepper to taste\n3 cloves of garlic\n2 shallots",
            ingredients: [eggNoodle, quail, shrimp, carrot, cornOil],
            allergens: [soyAllergen, shellfishAllergen, eggAllergen, glutenAllergen].compactMap { $0 }
        )

        let grilledRiceWithTuna = FoodMenu(
            name: "Grilled Rice with Tuna",
            image: "i_grilledricewithtuna",
            isSaved: false,
            desc: "200 grams of rice\n100 grams of tuna fish, boiled and shredded\n15 grams of spinach, boiled\n½ cm ginger, crushed\n½ cm galangal, crushed\n1 stalk lemongrass\n1 leaf of bay leaf\n15 ml coconut oil, for sautéing\nSalt to taste\nBanana leaves\nBasil leaves to taste\n3 cloves garlic\n4 shallots\n1 candlenut",
            ingredients: [whiteRice, tunaFish, spinach, coconutOil],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let steamedRiceWithShrimpInBananaLeaves = FoodMenu(
            name: "Steamed Rice with Shrimp in Banana Leaves",
            image: "i_steamedricewithshrimp",
            isSaved: false,
            desc: "150 grams of rice\n75 grams of shrimp, finely chopped\n200 grams of tofu, mashed\n1 egg, beaten\n1 stalk lemongrass\n2 leaves of bay leaf\n1 lime leaf\n10 ml soybean oil, for sautéing\nBasil leaves to taste\nSalt to taste\nSugar to taste\nPepper to taste\n2 cloves garlic\n3 shallots\n1 cm turmeric\n1 candlenut",
            ingredients: [whiteRice, shrimp, tofu, egg, soybeanOil],
            allergens: [shellfishAllergen, soyAllergen, eggAllergen].compactMap { $0 }
        )

        let steamedRiceWithEggAndBeef = FoodMenu(
            name: "Steamed Rice with Egg and Beef",
            image: "i_steamedricewitheggbeef",
            isSaved: false,
            desc: "150 grams of rice\n90 grams of ground beef\n1 tbsp grated carrot\n1 egg, beaten\n½ tsp soy sauce\n2 tsp sesame oil\n50 ml water\n10 ml canola oil\nSalt to taste\n1 clove garlic\n1 shallot",
            ingredients: [whiteRice, mincedBeef, carrot, egg, sesameOil, canolaOil],
            allergens: [soyAllergen, eggAllergen].compactMap { $0 }
        )

        let riceWithRendangEggAndTempeh = FoodMenu(
            name: "Rice with Rendang, Egg, and Tempeh",
            image: "i_ricewithrendangeggtempeh",
            isSaved: false,
            desc: "150 grams of rice\n2 boiled eggs\n60 grams of tempeh, cut into small pieces\n300 ml coconut milk\n½ cm galangal\n2 lime leaves\n1 stalk lemongrass\n½ tbsp sugar\nSalt to taste\n2 cloves garlic\n2 shallots\n½ cm ginger\n1 candlenut",
            ingredients: [whiteRice, egg, tempeh, coconutMilk, candlenut],
            allergens: [eggAllergen, soyAllergen].compactMap { $0 }
        )

        let chickenSatay = FoodMenu(
            name: "Chicken Satay",
            image: "i_chickensatay",
            isSaved: false,
            desc: "150 grams of rice\n100 grams of chicken fillet, diced\n1 clove of garlic, mashed\nLime, to taste\nPepper, to taste\nSweet soy sauce, to taste\nMargarine, to taste\nGrinded spices: 2 cloves of garlic\n3 shallots\n1 roasted candlenut\nPeanut sauce: 60 grams of fried peanuts, mashed\n1 kaffir lime leaf, thinly sliced\n1 ½ tbsp sweet soy sauce\n½ tbsp grated palm sugar\n½ tsp salt\n250 ml water\n2 tbsp coconut oil, for sautéing",
            ingredients: [chicken, butter, candlenut, peanuts, coconutOil],
            allergens: [soyAllergen, peanutAllergen].compactMap { $0 }
        )

        let riceWithFriedChickenGalangal = FoodMenu(
            name: "Rice with Fried Chicken Galangal",
            image: "i_ricefriedchickengalangal",
            isSaved: false,
            desc: "150 grams of rice\n100 grams of chicken, cut into small pieces\n1 stalk of lemongrass, smashed\n30 grams of grated galangal\nBoiled water\nSalt, to taste\nPalm oil, for sautéing and frying\nGround spices: 2 cloves of garlic\n2 shallots\n1 coriander seed\n½ cm of ginger",
            ingredients: [chicken, coconutOil],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let shrimpMeatballs = FoodMenu(
            name: "Shrimp Meatballs",
            image: "i_shrimpmeatballs",
            isSaved: false,
            desc: "120 grams of shrimp, finely chopped\n30 grams of wheat flour\n½ egg\n4 slices of bread, diced\nSoybean oil, for frying\nGround spices: 1 clove of garlic\n½ tsp salt\nPepper, to taste\nSugar, to taste",
            ingredients: [shrimp, flour, egg, whiteBread, soybeanOil],
            allergens: [glutenAllergen, soyAllergen, eggAllergen].compactMap { $0 }
        )

        let tofuFritters = FoodMenu(
            name: "Tofu Fritters",
            image: "i_tofufritters",
            isSaved: false,
            desc: "100 grams of tofu, mashed\n1 ½ eggs, beaten\n50 grams of carrot, diced\n40 grams of minced meat\nCorn oil, for frying\nGround spices: 3 shallots\n2 cloves of garlic\n½ tsp salt\nPepper, to taste",
            ingredients: [tofu, egg, carrot, mincedBeef, cornOil],
            allergens: [soyAllergen, eggAllergen].compactMap { $0 }
        )

        let beefCroquettes = FoodMenu(
            name: "Beef Croquettes",
            image: "i_beef_croquettes",
            isSaved: false,
            desc: "250 grams of steamed mashed potatoes\n1 tablespoon powdered milk\n100 grams ground beef\n30 grams diced carrots\n1/4 teaspoon pepper\n1 tablespoon wheat flour\n3 tablespoons margarine for sautéing\nSalt to taste\n2 eggs\n100 grams breadcrumbs\n\nSmooth seasoning:\n2 cloves garlic\n3 shallots",
            ingredients: [potato, mincedBeef, meat, carrot, flour, butter, egg],
            allergens: [glutenAllergen, dairyAllergen, eggAllergen].compactMap { $0 }
        )

        let steamedFishCake = FoodMenu(
            name: "Steamed Fish Cake",
            image: "i_steamed_fish_cake",
            isSaved: false,
            desc: "150 grams of fresh mackerel fish, finely ground\n40 grams tapioca flour\n1 teaspoon cornstarch\n50 ml coconut milk\n1 egg white, beaten\n1 spring onion, thinly sliced\nBanana leaves\n\nSmooth seasoning:\n2 cloves garlic\n3 shallots\n1/2 tablespoon sugar\n1 teaspoon salt\n1/4 teaspoon pepper",
            ingredients: [mackarel, coconutMilk],
            allergens: [fishAllergen, dairyAllergen].compactMap { $0 }
        )

        let stuffedTofuWithSausage = FoodMenu(
            name: "Stuffed Tofu with Sausage",
            image: "i_stuffed_tofu_with_sausage",
            isSaved: false,
            desc: "300 grams of white tofu, mashed\n1/2 teaspoon sugar\n1/4 teaspoon pepper\n1 egg, beaten\n1 clove garlic, minced\nSalt to taste\n150 grams beef sausage, chopped\nCorn oil for frying",
            ingredients: [tofu, egg, cornOil],
            allergens: [eggAllergen, soyAllergen].compactMap { $0 }
        )

        let yogurtBananaStrawberryCake = FoodMenu(
            name: "Yogurt Banana Strawberry Cake",
            image: "i_yogurt_banana_strawberry_cake",
            isSaved: false,
            desc: "1 ripe banana, mashed\n150 grams yogurt\nStrawberries to taste",
            ingredients: [banana, yogurt],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let tempeRoll = FoodMenu(
            name: "Tempe Roll",
            image: "i_tempe_roll",
            isSaved: false,
            desc: "100 grams tempeh, mashed\n50 grams ground beef\n2 eggs, beaten\n1 tablespoon breadcrumbs\n1/2 tablespoon wheat flour\nSalt to taste\nPepper to taste\n\nSmooth seasoning:\n1 clove garlic\n2 shallots\nCoriander to taste",
            ingredients: [tempeh, mincedBeef, egg, flour],
            allergens: [glutenAllergen, eggAllergen, soyAllergen].compactMap { $0 }
        )

        let chickenSotoPorridge = FoodMenu(
            name: "Chicken Soto Porridge with Coconut Milk",
            image: "i_chickensotoporridge",
            isSaved: false,
            desc: "60 grams (6 tablespoons) of white rice\n45 grams (4.5 tablespoons) of minced chicken\n30 grams (1 small piece) of tofu, diced\n30 grams (3 tablespoons) of water gourds\n15 grams (1.5 tablespoons) of carrots, diced\n1 bay leaf\n1 stalk of lemongrass\n1 kaffir lime leaf\n5 grams (1 tablespoon) of cooking oil\n30 ml (3 tablespoons) of coconut milk\n300 ml of chicken stock\n\nSpice Paste:\n1 clove of shallot\n1 clove of garlic\n1 cm turmeric\n1 cm ginger\n\nFruit:\n100 grams (3 small pieces) of oranges, juiced",
            ingredients: [ricePorridge, chicken, coconutMilk, tofu, waterGourd, carrot],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let redBeanSoupPorridge = FoodMenu(
            name: "Red Bean Soup Porridge",
            image: "i_redbeansoupporridge",
            isSaved: false,
            desc: "50 grams of rice (6 tablespoons)\n30 grams of chicken meat, minced (3 tablespoons)\n25 grams of egg (1/2 piece)\n10 grams of green beans (1 tablespoon)\n10 grams of carrot (1 tablespoon)\n10 grams of red beans (1 tablespoon)\n10 grams of scallions (1 stalk)\n1 stalk of celery\n300 ml of chicken stock\n2.5 grams of oil for sautéing (1/2 teaspoon)\n\nSeasonings:\n2 shallots\n2 cloves of garlic\n\nFruit:\n100 grams of oranges (2 pieces), juice extracted",
            ingredients: [ricePorridge, chicken, egg, greenBeans, carrot, redBeans, chickenBroth, orange],
            allergens: [eggAllergen, treenutAllergen, soyAllergen].compactMap { $0 }
        )

        // batch 2
        let datesAndBananaPure = FoodMenu(
            name: "Dates & Banana Puree",
            image: "i_dates_banana_puree",
            isSaved: false,
            desc: "1 ripe ambon banana\n4 dates, peeled\n2 tbsp sweet orange juice\n200 ml boiled water",
            ingredients: [banana, Dates, orange],
            allergens: [treenutAllergen].compactMap { $0 }
        )

        let papayaAndWatermelonPure = FoodMenu(
            name: "Papaya & Watermelon Puree",
            image: "i_papaya_watermelon_puree",
            isSaved: false,
            desc: "150 grams of red watermelon\n150 grams of papaya (remove seeds and yellow fibers)\n50 ml baby orange juice\n50 ml water/formula milk",
            ingredients: [watermelon, papaya, orange],
            allergens: [].compactMap { $0 }
        )

        let pearPure = FoodMenu(
            name: "Pear Puree",
            image: "i_pear_puree",
            isSaved: false,
            desc: "1 ripe yellow pear (±150 grams)\n150 ml boiled water",
            ingredients: [pear],
            allergens: [].compactMap { $0 }
        )

        let orangeAndPearPure = FoodMenu(
            name: "Orange & Pear Puree",
            image: "i_orange_pear_puree",
            isSaved: false,
            desc: "2 ripe green pears, peeled\n100 ml boiled water\nJuice of 1 sweet orange",
            ingredients: [pear, orange],
            allergens: [].compactMap { $0 }
        )

        let vegetablePure = FoodMenu(
            name: "Vegetable Puree",
            image: "i_vegetable_puree",
            isSaved: false,
            desc: "100 grams of peas\n50 grams of cucumber, peeled and sliced\n1 cabbage leaf (remove stem, cut into pieces)\n175 ml water",
            ingredients: [peas, cucumber, cabbage],
            allergens: [].compactMap { $0 }
        )

        let strawberryAndBananaPure = FoodMenu(
            name: "Strawberry & Banana Puree",
            image: "i_strawberry_banana_puree",
            isSaved: false,
            desc: "5 ripe strawberries\n1 ripe ambon banana\n50 ml sweet orange/baby orange juice",
            ingredients: [strawberry, banana, orange],
            allergens: [].compactMap { $0 }
        )

        let sweetPotatoAndSpinachPure = FoodMenu(
            name: "Sweet Potato & Spinach Puree",
            image: "i_sweet_potato_spinach_puree",
            isSaved: false,
            desc: "300 grams of sweet potato, peeled and diced\n50 grams of spinach, boiled\n1 tsp extra virgin olive oil",
            ingredients: [ubi, spinach],
            allergens: [].compactMap { $0 }
        )

        let taroPure = FoodMenu(
            name: "Taro Puree",
            image: "i_taro_puree",
            isSaved: false,
            desc: "100 grams of taro, peeled\n45 ml boiled water\n100 ml breast milk/formula",
            ingredients: [taro],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let potatoChickenAndQuailEggPudding = FoodMenu(
            name: "Potato, Chicken & Quail Egg Pudding",
            image: "i_potato_chicken_quail_egg_pudding",
            isSaved: false,
            desc: "100 grams of steamed mashed potato\n30 grams (3 tbsp) minced chicken\n10 grams (1 quail egg)\n15 grams (1 small tofu, diced)\n15 grams (1.5 tbsp) grated carrot\n10 grams (1 tbsp) pumpkin\n15 ml coconut milk\n1 lemongrass stalk\n1 bay leaf\n1 tbsp oil\n50 ml chicken broth\nSpices: 2 shallots, 2 garlic cloves\nJuice from 2 oranges (100 grams)",
            ingredients: [potato, chicken, quail, tofu, carrot, coconutMilk],
            allergens: [eggAllergen, soyAllergen].compactMap { $0 }
        )

        let cornMungBeansPorridge = FoodMenu(
            name: "Corn and Mung Beans Porridge",
            image: "i_cornmungbeansporridge",
            isSaved: false,
            desc: "2 tablespoons rice flour\n1 tablespoon mung bean flour\n1 tablespoon cornstarch\n100 ml water to dissolve the flour\n400 ml liquid milk\n100 grams ripe papaya\n30 ml boiled water",
            ingredients: [mungBeans, papaya],
            allergens: [dairyAllergen, glutenAllergen].compactMap { $0 }
        )

        let sweetPotatoMungBeansPorridge = FoodMenu(
            name: "Sweet Potato and Mung Beans Porridge",
            image: "i_sweetpotatomungbeansporridge",
            isSaved: false,
            desc: "100 grams sweet potato (half a piece)\n30 grams mung bean flour\n175 ml soy milk",
            ingredients: [ubi, mungBeans],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let soyBeanPorridge = FoodMenu(
            name: "Soy Bean Porridge",
            image: "i_soybeanporridge",
            isSaved: false,
            desc: "100 grams soybeans (soaked overnight)\n200 ml boiled water\n1 teaspoon formula milk powder",
            ingredients: [soyBeans],
            allergens: [soyAllergen, dairyAllergen].compactMap { $0 }
        )

        let snapperPumpkinPorridge = FoodMenu(
            name: "Snapper Fish and Pumpkin Porridge",
            image: "i_snapperpumpkinporridge",
            isSaved: false,
            desc: "75 grams snapper fillet\nJuice from 1/4 lime\n350 ml water\n200 grams pumpkin, peeled and diced\n1/2 stalk celery, thinly sliced",
            ingredients: [snapperFish, pumpkin],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let soybeanPumpkinPorridge = FoodMenu(
            name: "Soybean and Pumpkin Porridge",
            image: "i_soybeanpumpkinporridge",
            isSaved: false,
            desc: "200 grams pumpkin, peeled\n300 ml soy milk\n1/2 tomato, deseeded",
            ingredients: [pumpkin, tomato],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let menadoPorridge = FoodMenu(
            name: "Menado Porridge",
            image: "i_menadoporridge",
            isSaved: false,
            desc: "300 ml meat broth\n40 grams rice (half-cooked)\n40 grams steamed tempeh, mashed\n40 grams pumpkin, diced\n1 tablespoon sweet corn kernels\n3 spinach leaves, finely chopped\n4 celery leaves, finely chopped\n40 grams Medan anchovies, roasted and ground",
            ingredients: [whiteRice, tempeh, pumpkin, corn, spinach, saltedFish],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let greenRicePorridge = FoodMenu(
            name: "Green Rice Porridge",
            image: "i_greenriceporridge",
            isSaved: false,
            desc: "40 grams rice (half-cooked)\n300 ml broth\n1/2 tablespoon margarine\n1 tablespoon minced chicken\n1/2 clove garlic, thinly sliced\n3 broccoli florets, soaked in saltwater, drained\n3 tablespoons frozen peas, blanched\n1 spinach stalk, leaves finely chopped",
            ingredients: [ricePorridge, fishBroth, chicken, broccoli, peas, spinach],
            allergens: [glutenAllergen].compactMap { $0 }
        )

        let redBeanRicePorridge = FoodMenu(
            name: "Red Bean Rice Porridge",
            image: "i_redbeanriceporridge",
            isSaved: false,
            desc: "175 ml meat broth\n100 grams cooked red rice\n25 grams boiled red beans\n1/2 stalk scallion\n50 grams minced beef",
            ingredients: [redBeans, mincedBeef],
            allergens: [glutenAllergen].compactMap { $0 }
        )

        let redRicePorridge = FoodMenu(
            name: "Red Rice Porridge",
            image: "i_redriceporridge",
            isSaved: false,
            desc: "40 grams cooked red rice\n400 ml broth\n1 teaspoon margarine\n1/3 teaspoon sesame oil\n1/2 clove garlic, finely chopped\n1 slice ginger, finely chopped\n1 tablespoon snapper fillet\n2 tablespoons boiled red beans\n20 grams carrot, finely chopped\n1 stalk red spinach leaves, finely chopped",
            ingredients: [fishBroth, sesameOil, snapperFish, redBeans, carrot],
            allergens: [fishAllergen, glutenAllergen].compactMap { $0 }
        )

        let redRiceChickenPorridge = FoodMenu(
            name: "Red Rice Porridge with Chicken",
            image: "i_redricechickenporridge",
            isSaved: false,
            desc: "25 grams peeled water gourd\n100 grams cooked red rice\n25 grams minced chicken\n300 ml water",
            ingredients: [waterGourd, chicken],
            allergens: [].compactMap { $0 }
        )

        let redRiceTunaPorridge = FoodMenu(
            name: "Red Rice Porridge with Tuna Fish",
            image: "i_redricetunaporridge",
            isSaved: false,
            desc: "75 grams tuna fillet\n2 tablespoons lime juice\n200 grams cooked red rice\n300 ml water\n25 grams young green beans",
            ingredients: [tunaFish, greenBeans],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let tempehRicePorridge = FoodMenu(
            name: "Tempeh Rice Porridge",
            image: "i_tempehriceporridge",
            isSaved: false,
            desc: "400 ml water\n50 grams minced meat\n1 clove garlic, finely chopped\n40 grams half-cooked rice\n50 grams steamed tempeh, diced\n20 grams carrot, finely chopped\n1 green bean, finely chopped\n5 celery leaves, finely chopped\n1 teaspoon grated cheese",
            ingredients: [mincedBeef, whiteRice, tempeh, carrot, greenBeans, cheese],
            allergens: [soyAllergen, dairyAllergen].compactMap { $0 }
        )

        let oatPorridgeWithFruit = FoodMenu(
            name: "Oat Porridge with Fruit",
            image: "i_oatporridgewithfruit",
            isSaved: false,
            desc: "100 ml soy milk\n75 g quick-cooking oats\n1/2 ripe banana, mashed\n50 g papaya, diced\n50 g sweet mango, diced\n50 g apple, diced",
            ingredients: [banana, papaya, apple],
            allergens: [soyAllergen, glutenAllergen].compactMap { $0 }
        )

        let combinationVegetablePorridge = FoodMenu(
            name: "Combination Vegetable Porridge",
            image: "i_combinationvegetableporridge",
            isSaved: false,
            desc: "1/2 tbsp margarine\n1/2 clove garlic, finely chopped\n50 g red snapper fish, minced\n400 ml water\n20 g carrot, thinly sliced\n20 g water gourd\n10 spinach leaves, finely chopped\n4 celery leaves, finely chopped\n1/2 stalk spring onion, finely chopped\n3 tbsp rice flour\n1 tbsp mung bean flour",
            ingredients: [snapperFish, carrot, waterGourd, spinach, riceFlour],
            allergens: [fishAllergen, glutenAllergen].compactMap { $0 }
        )

        let cassavaPorridge = FoodMenu(
            name: "Cassava Porridge",
            image: "i_cassavaporridge",
            isSaved: false,
            desc: "100 g cassava, peeled\n150 ml beef broth",
            ingredients: [cassava],
            allergens: [].compactMap { $0 }
        )

        let milkMarrowPorridge = FoodMenu(
            name: "Milk Marrow Porridge",
            image: "i_milkmarrowporridge",
            isSaved: false,
            desc: "3 tbsp rice flour\n250 ml formula milk\n1/4 tsp salt\n2 tbsp brown sugar, sliced\n75 ml boiled water",
            ingredients: [riceFlour],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let sweetAppleMilkPorridge = FoodMenu(
            name: "Sweet Apple Milk Porridge",
            image: "i_sweetapplemilkporridge",
            isSaved: false,
            desc: "3 tbsp rice flour\n250 ml formula milk\n1/4 tsp salt\n2 apple, choped\n75 ml boiled water",
            ingredients: [riceFlour, apple],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let spinachCheeseMilkPorridge = FoodMenu(
            name: "Spinach Cheese Milk Porridge",
            image: "i_spinachcheesemilkporridge",
            isSaved: false,
            desc: "2 handfuls spinach, boiled\n100 g pumpkin, steamed\n3 tbsp rice flour\n250 ml boiled water\n1 tsp formula milk\n2 tsp grated cheddar cheese",
            ingredients: [spinach, pumpkin, riceFlour, cheese],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let greenBeanBiscuitMilkPorridge = FoodMenu(
            name: "Green Bean Biscuit Milk Porridge",
            image: "i_greenbeanbiscuitmilkporridge",
            isSaved: false,
            desc: "1 tbsp boiled green beans\n200 ml formula milk\n4 pieces Marie biscuit (e.g., Regal, Roma)",
            ingredients: [mungBeans],
            allergens: [dairyAllergen, glutenAllergen].compactMap { $0 }
        )

        let mixedFruitMilkPorridge = FoodMenu(
            name: "Mixed Fruit Milk Porridge",
            image: "i_mixedfruitmilkporridge",
            isSaved: false,
            desc: "1 ripe banana\n50 g ripe papaya, blended\n50 g ripe pear, finely grated\n1 tbsp sweet orange juice\n1 tbsp cornstarch\n1 tsp formula milk\n200 ml water",
            ingredients: [banana, papaya, pear, orange],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let oatMilkPorridge = FoodMenu(
            name: "Oat Milk Porridge",
            image: "i_oatmilkporridge",
            isSaved: false,
            desc: "3 tbsp oatmeal\n300 ml boiled water\n2 tsp formula milk\n1/2 tsp sugar",
            ingredients: [oatFlour],
            allergens: [glutenAllergen, dairyAllergen].compactMap { $0 }
        )

        let milkOatCheesePorridge = FoodMenu(
            name: "Milk Oat Cheese Porridge",
            image: "i_milkoatcheeseporridge",
            isSaved: false,
            desc: "50 g silken tofu\n2 tbsp oatmeal\n300 ml boiled water\n2 tsp formula milk\n1 tsp grated cheddar cheese",
            ingredients: [oatFlour, cheese],
            allergens: [soyAllergen, glutenAllergen, dairyAllergen].compactMap { $0 }
        )

        let sweetCornAndSweetPotatoPorridge = FoodMenu(
            name: "Sweet Corn and Sweet Potato Porridge",
            image: "i_sweetcornandsweetpotatoporridge",
            isSaved: false,
            desc: "100 g sweet potato (white)\n1 ear sweet corn, grated\n200 ml boiled water\n2 tsp formula milk",
            ingredients: [ubi, corn],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let macaroniMilkPorridge = FoodMenu(
            name: "Macaroni Milk Porridge",
            image: "i_macaroni_milk_porridge",
            isSaved: false,
            desc: "100 grams of boiled macaroni\n1 boiled egg yolk\n50 grams of boiled peas\n200 ml of boiled water\n1 tablespoon of rice flour\n1 teaspoon of formula milk\n2 teaspoons of grated cheddar cheese",
            ingredients: [macaroni, egg, peas, cheese],
            allergens: [glutenAllergen, dairyAllergen, eggAllergen].compactMap { $0 }
        )

        let soyMilkPorridge = FoodMenu(
            name: "Soy Milk Porridge",
            image: "i_soy_milk_porridge",
            isSaved: false,
            desc: "75 grams of steamed tempeh\n75 grams of steamed tofu\n300 ml of soy milk\n2 tablespoons of cornstarch\n1/4 teaspoon of salt",
            ingredients: [tempeh, tofu, soyBeans],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let steamedRiceWithEggVermicelli = FoodMenu(
            name: "Steamed Rice with Egg Vermicelli",
            image: "i_steamed_rice_egg_vermicelli",
            isSaved: false,
            desc: "1 tablespoon of margarine\n1 clove of minced garlic\n50 grams of washed rice\n1 sheet of fresh ear mushroom, thinly sliced\n250 ml of chicken broth\n1 beaten egg\n1 tablespoon of vermicelli (soaked in warm water), cut into pieces\n1/4 teaspoon of sugar",
            ingredients: [whiteRice, egg, bihun, chickenBroth],
            allergens: [glutenAllergen, eggAllergen].compactMap { $0 }
        )

        let steamedCassavaMixedWithCheese = FoodMenu(
            name: "Steamed Cassava Mixed with Cheese",
            image: "i_steamed_cassava_cheese",
            isSaved: false,
            desc: "100 grams of diced beetroot\n200 ml of soy milk\n200 grams of grated cassava\n1 diced banana\n30 grams of grated cheddar cheese\n50 grams of diced mango",
            ingredients: [soyBeans, cassava, banana, cheese],
            allergens: [soyAllergen, dairyAllergen].compactMap { $0 }
        )

        let steamedCornVegetables = FoodMenu(
            name: "Steamed Corn Vegetables",
            image: "i_steamed_corn_vegetables",
            isSaved: false,
            desc: "30 grams of half-steamed rice\n50 grams of sweet corn kernels, mashed\n300 ml of chicken broth\n10 leaves of red spinach, sliced\n50 grams of peeled, thinly sliced luffa\n1/2 teaspoon of salt\n1/2 teaspoon of sugar",
            ingredients: [whiteRice, corn, chickenBroth, spinach],
            allergens: [].compactMap { $0 }
        )

        let curryFishTeam = FoodMenu(
            name: "Curry Fish Team",
            image: "i_curry_fish_team",
            isSaved: false,
            desc: "100 grams of mackerel (skinless)\n1 teaspoon of lemon juice\n1/2 teaspoon of salt\n1 tablespoon of oil\nSpices: 1 shallot, 1 clove of garlic, 1/2 cm turmeric, 1/2 candlenut\n350 ml of coconut milk\n1 bay leaf\n60 grams of rice",
            ingredients: [mackarel, coconutMilk, whiteRice],
            allergens: [fishAllergen].compactMap { $0 }
        )

        let mincedChickenCauliflowerTeam = FoodMenu(
            name: "Minced Chicken Cauliflower Team",
            image: "i_minced_chicken_cauliflower_team",
            isSaved: false,
            desc: "100 grams of cauliflower, cut into pieces, soaked in salted water\n1 tablespoon of cooking oil\n1 clove of minced garlic\n1 tablespoon of minced chicken\n1/4 teaspoon of salt\n1/4 teaspoon of sugar\n60 grams of washed rice\n200 ml of chicken broth",
            ingredients: [cabbage, chicken, chickenBroth],
            allergens: [].compactMap { $0 }
        )

        let steamedRiceWithFishEggsVegetables = FoodMenu(
            name: "Steamed Rice with Fish, Eggs, and Vegetables",
            image: "i_steamedrice_fisheggs_vegetables",
            isSaved: false,
            desc: "100 grams (10 tbsp) steamed rice\n30 grams (3 pcs) quail eggs, beaten\n30 grams (3 tbsp) mackerel fillet\n10 grams (1 tbsp) chopped mustard greens\n20 grams (2 tbsp) chopped tomato\n300 ml chicken broth\n7.5 ml (1.5 tsp) coconut oil",
            ingredients: [quail, longJawedMackerel, tomato, chickenBroth, coconutOil],
            allergens: [fishAllergen, eggAllergen].compactMap { $0 }
        )

        let steamedRiceVermicelliTofuTempeh = FoodMenu(
            name: "Steamed Rice Vermicelli with Tofu and Tempeh",
            image: "i_steamedrice_vermicelli_tofu_tempeh",
            isSaved: false,
            desc: "100 grams rice vermicelli\n1 small piece of tofu\n50 grams tempeh\n1 stalk spring onion\n1/4 tsp salt\n1/4 tsp sugar\n150 ml meat broth\n1 tbsp cooking oil",
            ingredients: [bihun, tofu, tempeh],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let steamedRiceWithStirFriedFish = FoodMenu(
            name: "Steamed Rice with Stir-Fried Fish",
            image: "i_steamedrice_stirfried_fish",
            isSaved: false,
            desc: "100 grams diced tilapia fish\n1 tsp lemon juice\n1/2 tsp salt\n1 tbsp cooking oil\n1/2 tsp sesame oil\n1 clove garlic, minced\n1/2 cm ginger, crushed\n60 grams rice, washed\n1 tsp sweet soy sauce\n1 tsp oyster sauce\n350 ml chicken broth",
            ingredients: [tilapiaFish, sesameOil, chickenBroth],
            allergens: [fishAllergen, glutenAllergen].compactMap { $0 }
        )

        let bananaSweetPotatoBallsYoghurtSauce = FoodMenu(
            name: "Banana Sweet Potato Balls with Yoghurt Sauce",
            image: "i_banana_sweetpotato_balls_yoghurt_sauce",
            isSaved: false,
            desc: "50 grams yellow sweet potato\n50 grams purple sweet potato\n50 grams white sweet potato\n1 Ambon banana, mashed\n3 tbsp powdered milk\nThick yoghurt (for sauce)",
            ingredients: [ubi, banana, yogurt],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let fishNuggetBun = FoodMenu(
            name: "Fish Nugget Bun",
            image: "i_fish_nugget_bun",
            isSaved: false,
            desc: "150 grams tilapia fish, diced\n1/4 tsp ground pepper\n1/2 tsp fine salt\n60 grams wheat flour\n2 eggs, beaten\n60 grams breadcrumbs\nCooking oil for frying\n3 soft buns/burger rolls\n50 grams lettuce\n50 grams tomato, sliced\n50 grams cucumber, sliced\n40 grams onion, sliced\n60 ml tomato sauce\n3 tbsp mayonnaise",
            ingredients: [tilapiaFish, flour, egg, tomato, cucumber],
            allergens: [fishAllergen, eggAllergen, glutenAllergen].compactMap { $0 }
        )

        let yellowPumpkinFishMeatballs = FoodMenu(
            name: "Yellow Pumpkin Fish Meatballs",
            image: "i_yellowpumpkin_fish_meatballs",
            isSaved: false,
            desc: "100 grams long-jawed mackerel, minced\n175 grams yellow pumpkin, steamed and mashed\n3 shallots, minced\n2 cloves garlic, minced\n1/4 tsp ground pepper\nSalt and sugar to taste\n1 egg white\n25 ml liquid milk\n100 grams tapioca flour\n1 stalk spring onion, finely sliced\nCooking oil for frying\nMayonnaise for serving",
            ingredients: [longJawedMackerel, pumpkin],
            allergens: [fishAllergen, eggAllergen, dairyAllergen].compactMap { $0 }
        )

        let smokedMeatPotatoFrittata = FoodMenu(
            name: "Smoked Meat Potato Frittata",
            image: "i_smokedmeat_potato_frittata",
            isSaved: false,
            desc: "100 grams boiled potato\n60 grams cabbage\n50 grams smoked meat\n5 eggs\n1/4 tsp ground pepper\n1/4 tsp ground nutmeg\n1/2 tsp fine salt\n60 ml tomato sauce\n1 tomato, diced\n1 tbsp grated cheddar/mozzarella cheese\n1 stalk spring onion, finely sliced\n2 tbsp liquid milk\n1/2 tbsp margarine",
            ingredients: [potato, cabbage, egg, tomato, cheese],
            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
        )

        let friedRice = FoodMenu(
            name: "Fried Rice",
            image: "i_fried_rice",
            isSaved: false,
            desc: "100 grams chicken meatballs\n100 grams fish meatballs\n3 tbsp cooking oil\n1 tsp sesame oil\n4 cloves garlic, minced\n50 grams green peas\n500 grams steamed rice\n1 tbsp soy sauce\n1 tbsp sweet soy sauce\n1/2 tsp ground pepper\n1 tsp fine salt\n2 stalks spring onion, sliced",
            ingredients: [fishBalls, meatball, sesameOil, peas],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let friedOkra = FoodMenu(
            name: "Fried Okra",
            image: "i_fried_okra",
            isSaved: false,
            desc: "3 okra\n250 grams minced beef\n2 cloves garlic, minced\n2 stalks spring onion, finely sliced\n1/2 tsp fine salt\n1/2 tsp ground pepper\n1 egg, beaten\n1 tbsp wheat flour\nCooking oil for frying",
            ingredients: [okra, mincedBeef, egg],
            allergens: [eggAllergen, glutenAllergen].compactMap { $0 }
        )

        let boborTerung = FoodMenu(
            name: "Bobor Terung (Eggplant Stew)",
            image: "i_bobor_terung",
            isSaved: false,
            desc: "400 ml medium coconut milk\n2 cm galangal\n2 cm ginger\n1 bay leaf\n4 shallots, minced\n1 clove garlic, minced\n1 tsp coriander\n1 tbsp dried shrimp, soaked and drained\n1 piece fried tofu, diced\n250 grams purple eggplant, sliced",
            ingredients: [eggPlant],
            allergens: [shellfishAllergen, soyAllergen].compactMap { $0 }
        )

        let caisimBabyCornTauco = FoodMenu(
            name: "Caisim and Baby Corn with Tauco Seasoning",
            image: "i_caisim_babycorn_tauco",
            isSaved: false,
            desc: "200 grams caisim (mustard greens)\n150 grams baby corn\n8 fish meatballs\n3 tbsp cooking oil\n4 shallots, thinly sliced\n1 clove garlic, thinly sliced\n1 green chili, deseeded and sliced\n1 red chili, deseeded and sliced\n2 cm galangal, crushed\n1 bay leaf\n2 tbsp sweet tauco (fermented soy paste)\n150 ml water\n1 tsp fine salt\n1/2 tsp ground pepper\n1 tsp chicken broth powder",
            ingredients: [corn, fishBalls],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let avocadoPure = FoodMenu(
            name: "Avocado Puree",
            image: "i_avocadopure",
            isSaved: false,
            desc: "125 grams of ripe avocado (+2 fruits)\n25 ml of boiled water\n100 ml of boiled water/expressed breast milk/formula milk",
            ingredients: [avocado],
            allergens: []
        )

        let melonAvocadoPure = FoodMenu(
            name: "Melon and Avocado Puree",
            image: "i_melonandavocadopure",
            isSaved: false,
            desc: "150 grams of orange melon\n1 ripe avocado\n100 ml formula milk",
            ingredients: [avocado],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let strawberryPure = FoodMenu(
            name: "Strawberry Puree",
            image: "i_strawberrypure",
            isSaved: false,
            desc: "7 fresh ripe strawberries\n1 tsp honey\n200 ml formula milk",
            ingredients: [strawberry],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let beefLiverPure = FoodMenu(
            name: "Beef Liver Puree",
            image: "i_beefliverpure",
            isSaved: false,
            desc: "30 grams of beef liver\n30 grams of rice\n1.5 tbsp grated carrot\n15 grams of tomato\n1 clove of garlic\n1/2 shallot\n15 grams of onion",
            ingredients: [beefLiver, whiteRice, carrot, tomato],
            allergens: []
        )

        let fruitIce = FoodMenu(
            name: "Fruit Ice",
            image: "i_fruitice",
            isSaved: false,
            desc: "1 Royal Gala apple\n1 green apple (Manalagi or Granny Smith)\nJuice of 1 lemon\n350 grams of watermelon\n350 ml melon\n200 grams of canned mandarin oranges, drained\n1 liter sweet orange juice\n500 ml sweet soda\nIce cubes as needed",
            ingredients: [apple, watermelon, orange],
            allergens: []
        )

        let melonPudding = FoodMenu(
            name: "Melon Pudding",
            image: "i_melonpudding",
            isSaved: false,
            desc: "1 melon, halved\n400 ml water\n2 packs of green agar-agar\n100 ml melon syrup\n1/4 tsp salt\n2 egg whites\nSauce:\n150 grams sweetened condensed milk\n450 ml water\n50 grams sugar\n1/2 tsp salt\n2 egg yolks\n200 ml orange extract\n1 tbsp cornstarch dissolved in a little water",
            ingredients: [jellyPowder, eggYolk],
            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
        )

        let durianPudding = FoodMenu(
            name: "Durian Pudding",
            image: "i_durianpudding",
            isSaved: false,
            desc: "1 egg yolk\n2 tbsp sweetened condensed milk\n1 pack of colorless agar-agar\n300 grams of durian flesh, mashed\n75 grams of sugar\n1/4 tsp salt\n600 ml coconut milk\nVanilla ice cream",
            ingredients: [eggYolk, jellyPowder, coconutMilk],
            allergens: [eggAllergen, dairyAllergen].compactMap { $0 }
        )

        let eggTofuOkraSoup = FoodMenu(
            name: "Egg Tofu Okra Soup",
            image: "i_eggtofuokrasoup",
            isSaved: false,
            desc: "3 grams of okra\n1 pack of egg tofu\n12 boiled quail eggs, peeled\n600 ml water\n2 cm ginger, bruised\n1 celery stalk, root removed (keep whole)\n1/2 onion, sliced\nOil for frying and sautéing\nSeasoning paste:\n3 shallots\n1 garlic\n1/2 tsp stock powder\nGarnish:\n1 scallion, sliced\n35 grams rice noodles\nFried shallots",
            ingredients: [okra, tofu, quail],
            allergens: [eggAllergen, soyAllergen].compactMap { $0 }
        )

        let butterDuckPure = FoodMenu(
            name: "Butter Duck Puree",
            image: "i_butterduckpure",
            isSaved: false,
            desc: "50 grams of braised duck\n1 garlic clove\n1/2 shallot\n5 grams butter\n60 grams white rice\n1 cm ginger",
            ingredients: [duck, butter, whiteRice],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let spinachOkraPorridge = FoodMenu(
            name: "Spinach and Okra Porridge",
            image: "i_spinachokraporridge",
            isSaved: false,
            desc: "1 okra\n1/4 bunch spinach\n2 shallots, bruised\n2 garlic cloves, bruised\nPinch of salt\n2 tbsp rice",
            ingredients: [okra, spinach, whiteRice],
            allergens: []
        )

        let thailandCassava = FoodMenu(
            name: "Thailand Cassava",
            image: "i_thailandcassava",
            isSaved: false,
            desc: "100 grams cassava\n250 ml UHT milk\n2 cubes of cheese\n1 tbsp sugar (optional)\nPinch of salt (optional)\n2 tbsp instant coconut milk\n2 pandan leaves\n1.5 tbsp cornstarch",
            ingredients: [cassava, cheese, coconutMilk],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let cucumberPure = FoodMenu(
            name: "Cucumber Puree",
            image: "i_cucumberpure",
            isSaved: false,
            desc: "1 Japanese cucumber",
            ingredients: [cucumber],
            allergens: []
        )

        let doriFishPorridge = FoodMenu(
            name: "Dori Fish Porridge",
            image: "i_dorifishporridge",
            isSaved: false,
            desc: "50 grams dori fillet, diced into 1.5 cm\n4 tbsp rice\n20 grams broccoli, chopped\n1 garlic clove\nGrated cheddar cheese\nDemineralized water",
            ingredients: [dori, whiteRice, broccoli],
            allergens: [fishAllergen, dairyAllergen].compactMap { $0 }
        )

        let doriFishAndBroccoliPorridge = FoodMenu(
            name: "Dori Fish and Broccoli Porridge",
            image: "i_dorifishandbroccoliporridge",
            isSaved: false,
            desc: "20 grams of dori fish\n1 tbsp organic white rice\n1 garlic clove\n5 cm spring onion\n1/4 medium-sized potato\n1 floret organic broccoli\n1 block baby-specific cheese\n1/2 tbsp unsalted butter\n250 ml mineral water",
            ingredients: [dori, whiteRice, potato, broccoli, butter],
            allergens: [fishAllergen, dairyAllergen].compactMap { $0 }
        )

        let peanutButterJam = FoodMenu(
            name: "Peanut Butter Jam",
            image: "i_peanutbutterjam",
            isSaved: false,
            desc: "250 grams raw peanuts\n2 tbsp honey\n1 tbsp virgin coconut oil",
            ingredients: [peanuts, coconutOil],
            allergens: [peanutAllergen].compactMap { $0 }
        )

        let peanutButterNoodle = FoodMenu(
            name: "Peanut Butter Noodle",
            image: "i_peanutbutternoodle",
            isSaved: false,
            desc: "Noodles\n3 tbsp peanut butter\n1 tbsp EVO\n1/2 cup water\n2 shallots\nShredded chicken",
            ingredients: [eggNoodle, chicken, peanuts],
            allergens: [peanutAllergen].compactMap { $0 }
        )

        // batch 3
        let abonLele = FoodMenu(
            name: "Catfish Floss",
            image: "i_catfishfloss",
            isSaved: false,
            desc: "2 whole catfish, cleaned\n1 slice of tempeh\n1 lime\n4 stalks of Chinese chives\n4 cloves of garlic\n2 shallots\n1 thumb-sized piece of turmeric\n1/2 tablespoon Himalayan salt\n1/4 teaspoon sugar\n4 tablespoons extra light olive oil (ELOO)\n1/4 teaspoon homemade salmon stock powder",
            ingredients: [catfish, tempeh],
            allergens: [fishAllergen, soyAllergen].compactMap { $0 }
        )

        let taroEggYolkPuree = FoodMenu(
            name: "Taro and Egg Yolk Puree",
            image: "i_taroeggyolkpuree",
            isSaved: false,
            desc: "100 grams of taro, diced into small cubes\n1 egg yolk",
            ingredients: [taro, eggYolk],
            allergens: [eggAllergen].compactMap { $0 }
        )

        let taroCheeseRollCake = FoodMenu(
            name: "Taro Cheese Roll Cake",
            image: "i_tarocheeserollcake",
            isSaved: false,
            desc: "500 grams of purple sweet potato (taro)\n1 tablespoon butter\n1 tablespoon granulated sugar\nGrated cheese to taste\nSalt to taste",
            ingredients: [taro, butter, cheese],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let potatoMeatBroccoliEggplantPorridge = FoodMenu(
            name: "Potato Meat Broccoli Eggplant Porridge",
            image: "i_potatomeatbroccolieggplantporridge",
            isSaved: false,
            desc: "2 medium-sized grated potatoes\n1 tablespoon of ground meat\n3 pieces of broccoli\n1/4 of an eggplant\nMargarine as needed\n1/2 clove of garlic\n1/2 clove of shallot\n100 ml of boiled water\n1 tablespoon of instant coconut milk",
            ingredients: [potato, meat, broccoli, eggPlant, coconutMilk],
            allergens: [soyAllergen].compactMap { $0 }
        )

        let tunaEggplantTomatoPorridge = FoodMenu(
            name: "Tuna Eggplant Tomato Porridge",
            image: "i_tunaeggplanttomatoporridge",
            isSaved: false,
            desc: "50 grams of tuna\n1 large potato\n1/2 tomato (remove seeds)\n2 pieces of purple eggplant\n2 pieces of tofu\n1 tbsp of chopped onion\n110 ml plain UHT milk\nA pinch of powdered broth\n200 ml of boiled water\nEnough canola oil",
            ingredients: [tunaFish, potato, tomato, eggPlant, tofu, canolaOil],
            allergens: [fishAllergen, soyAllergen, dairyAllergen].compactMap { $0 }
        )

        let mangoStickyRice = FoodMenu(
            name: "Mango Sticky Rice",
            image: "i_mangostickyrice",
            isSaved: false,
            desc: "Puree ripe mango to taste (puree means blending the mango until smooth)\nCooked white rice to taste\n70 ml instant coconut milk\nPandan leaf\nWater to taste",
            ingredients: [coconutMilk, glutinousRice],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let stickyRiceBrownSugarPorridge = FoodMenu(
            name: "Sticky Rice Brown Sugar Porridge",
            image: "i_stickyRiceBrownSugarPorridge",
            isSaved: false,
            desc: "250 grams of white glutinous rice\n100 grams of grated coconut\n1 piece of palm sugar, sliced\n6 tablespoons of white sugar, adjust to desired sweetness\n1 teaspoon of salt\n½ thumb of ginger, crushed\n2 pandan leaves (or vanilla powder as a substitute if pandan is unavailable)\n½ packet of Kara coconut milk for topping",
            ingredients: [glutinousRice, coconutMilk],
            allergens: [treenutAllergen].compactMap { $0 }
        )

        let chickenMeatballSoup = FoodMenu(
            name: "Chicken Meatball Soup with Anchovy",
            image: "i_chickenmeatballsoup",
            isSaved: false,
            desc: "Ingredients for Meatball Mixture:\n3 pieces of chicken drumsticks\n1 tablespoon fresh Medan anchovies (white anchovies)\n1 free-range chicken egg\n1 clove of garlic\n1 shallot\n1/4 onion\nSalt to taste\n\nIngredients for Soup:\n3 broccoli florets\n2 cloves of garlic\n2 shallots\n2 tablespoons of onion",
            ingredients: [chicken, saltedFish, egg, broccoli],
            allergens: [fishAllergen, eggAllergen].compactMap { $0 }
        )

        let achovyandchickenPorridge = FoodMenu(
            name: "Fish Porridge with Medan Anchovy, Chicken, and Village Egg",
            image: "i_fishporridge",
            isSaved: false,
            desc: "3 tbsp Organic Rice [Carb]\n2 tbsp Medan Anchovy [ProHe]\n3 tbsp Ground Chicken [ProHe]\n1 Village Chicken Egg [ProHe]\n1 tbsp Red Beans [ProNa]\n1 pc Unsalted Butter [Fat]\nCarrot [Vegetable]\n1 clove Shallot and 1 clove Garlic [Aromatic Seasoning]\n50 ml Beef Bone Broth and a pinch of Salt [Seasoning]\n200 ml Mineral Water",
            ingredients: [saltedFish, chicken, egg, redBeans, butter, carrot],
            allergens: [fishAllergen, eggAllergen].compactMap { $0 }
        )

        let cheeseGurameRice = FoodMenu(
            name: "Cheese Gurame Rice",
            image: "i_nasitimguramekeju",
            isSaved: false,
            desc: "100 grams of rice\n60 grams of fried gurame fish, chopped\n1 1/2 tablespoons of grated carrot\n1/4 of a tomato, diced\n12.5 ml of canola oil\nSalt to taste (I skipped because I added cheese)\nChopped celery leaves (I used green onions)\n1 tablespoon of grated cheese (added by me)\n200 ml of mineral water\nGround spices: 1 shallot\n1 clove of garlic",
            ingredients: [carp, carrot, tomato, canolaOil, cheese],
            allergens: [fishAllergen, dairyAllergen].compactMap { $0 }
        )

        let carpMustardPorridge = FoodMenu(
            name: "Carp Mustard Porridge",
            image: "i_carpmustardporridge",
            isSaved: false,
            desc: "50 grams of Gurame Fillet\n30 grams of White Tofu\n4 tablespoons of Rice\n3 Mustard leaves\n2 stalks of Celery\n1 clove of Garlic\n1 teaspoon of Onion\nCanola oil as needed\nStock powder as needed\nOrganic soy sauce as needed\nBoiled water as needed",
            ingredients: [carp, tofu, canolaOil],
            allergens: [soyAllergen, fishAllergen].compactMap { $0 }
        )

        let meatballCurry = FoodMenu(
            name: "Meatball Curry",
            image: "i_meatballcurry",
            isSaved: false,
            desc: "1 pack of Kara coconut milk\n1 inch ginger\n1 inch crushed galangal\n1 stalk crushed lemongrass\n2 kaffir lime leaves\n2 bay leaves\n1/2 tsp mushroom broth\n2 tbsp salt\n1 tsp sugar\nA pinch of fried shallots\n800 ml water (adjust to preference)\nSpice Paste\n2 cloves garlic\n5 shallots\nA pinch of coriander\nA pinch of turmeric\n3 candlenuts",
            ingredients: [coconutMilk, candlenut, meatball],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let ricePorridgeWithDateSyrup = FoodMenu(
            name: "Rice Porridge with Date Syrup",
            image: "i_riceporridgewithdatesyrup",
            isSaved: false,
            desc: "3 tbsp rice flour\nSufficient water\n1 tbsp coconut milk (can be substituted with grated cheese)\n1 date\nPandan leaves",
            ingredients: [riceFlour, coconutMilk, Dates],
            allergens: [dairyAllergen].compactMap { $0 }
        )

        let dateBreadPudding = FoodMenu(
            name: "Date Bread Pudding",
            image: "i_datebreadpudding",
            isSaved: false,
            desc: "1 slice of white bread without crust\n75 ml full cream UHT milk\n1 block of Belcube cheese\n2 dates\nSugar and salt to taste",
            ingredients: [whiteBread, cheese, Dates],
            allergens: [glutenAllergen, dairyAllergen].compactMap { $0 }
        )

        // Connect menus to egg ingredient
        chickenLiver.menus = [chickenLiverPorridge, chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, quailEggandChickenLiverPorridge, potatoandChickenliverPorridge, chickenBreastandLiverPorridge, catfishPorridge, yellowSteamedRiceChickenLiverStew]
        whiteRice.menus = [doriFishAndBroccoliPorridge, doriFishPorridge, spinachOkraPorridge, butterDuckPure, curryFishTeam, steamedCornVegetables, steamedRiceWithEggVermicelli, tempehRicePorridge, menadoPorridge, shrimpFriedRice, chickenLiverPorridge, chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, steamedLongJawedMackerelPorridgeinBananaLeaf, beefandEggPorridge, shrimpTofuPorridge, shrimpGreenbeansPorridge, shrimpandCoconutMilkPorridge, catfishPorridge, tofuandCatfishPorridge, beefLiverPorridge, tialpiafishPorridge, snapperfishPorridge, tunaandCarrotSteam, tunaSteam, riceBall, steamedGuremeRice, riceWithButterFriedDuck, savoryRiceWithStirFriedFishBallsAndBroccoli, beefSotoSteam, yellowSteamedRiceChickenLiverStew, beefTempehStew, steamedChickenRice, broccoliShrimpSteamed, beefSteamed, steamedSoySauceChicken, steamedMackerelStirFry, steamedRiceChickenMushroom, steamChickenStew, riceChickenMushroom, chickenSoup, stirFriedTofuShrimp, mixedEggRice, grilledRiceWithTuna, steamedRiceWithShrimpInBananaLeaves, steamedRiceWithEggAndBeef, riceWithRendangEggAndTempeh]
        coconutMilk.menus = [ricePorridgeWithDateSyrup, meatballCurry, stickyRiceBrownSugarPorridge, mangoStickyRice, potatoMeatBroccoliEggplantPorridge, thailandCassava, durianPudding, curryFishTeam, potatoChickenAndQuailEggPudding, chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, shrimpTofuPorridge, shrimpandCoconutMilkPorridge, riceWithRendangEggAndTempeh, steamedFishCake, chickenSotoPorridge, beefGadonRice, beefLiverPorridge, steamedChickenRice, savoryRiceWithStirFriedFishBallsAndBroccoli, beefLiverSambalSteamed, tunaSteam, chickenLemper]
        cornOil.menus = [stuffedTofuWithSausage, tofuFritters, chickenLiverPorridge, mixedEggRice, steamedLongJawedMackerelPorridgeinBananaLeaf, shrimpGreenbeansPorridge, tunaandCarrotSteam, beefTempehStew, steamedChickenRice, broccoliShrimpSteamed, steamedSoySauceChicken, steamedMackerelStirFry, tunaSteam, potatoBeefSteam, steamChickenStew, riceChickenMushroom, mackerelBalls, chickenLemper, cheesePotatoBalls, braisedDuckRice, friedNoodlesQuailEggs, grilledRiceWithTuna]
        coconutOil.menus = [peanutButterJam, steamedRiceWithFishEggsVegetables, chickenLiverPorridgeWithCoconutMilk, mackerelPorridge, tofuandCatfishPorridge, beefPorridge, yellowSteamedRiceChickenLiverStew, broccoliShrimpSteamed, chickenSatay, riceWithFriedChickenGalangal]
        canolaOil.menus = [carpMustardPorridge, cheeseGurameRice, tunaEggplantTomatoPorridge, chickenBreastandLiverPorridge, tialpiafishPorridge, steamedGuremeRice, chickenNoodleSteam, macaroniSteam, steamedRiceWithEggAndBeef]
        soybeanOil.menus = [shrimpMeatballs, snapperfishPorridge, steamedChickenRice, beefLiverSambalSteamed, riceBall, stirFriedTofuShrimp, steamedRiceWithShrimpInBananaLeaves]
        sesameOil.menus = [friedRice, steamedRiceWithStirFriedFish, redRicePorridge, beefandEggPorridge, beefSteamed, steamedMackerelStirFry, braisedDuckRice, steamedRiceChickenMushroom, riceWithButterFriedDuck, stirFriedTofuShrimp, steamedRiceWithEggAndBeef]
        spinach.menus = [spinachOkraPorridge, steamedCornVegetables, spinachCheeseMilkPorridge, combinationVegetablePorridge, greenRicePorridge, menadoPorridge, chickenLiverPorridge, beefPorridge, beefLiverPorridge, grilledRiceWithTuna, sweetPotatoAndSpinachPure]
        carrot.menus = [cheeseGurameRice, achovyandchickenPorridge, combinationVegetablePorridge, tempehRicePorridge, redRicePorridge, potatoChickenAndQuailEggPudding, redBeanSoupPorridge, chickenSotoPorridge, beefCroquettes, tofuFritters, chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, potatoandChickenliverPorridge, chickenButterPorridge, chickenCurryPorridge, shrimpandCoconutMilkPorridge, chickenandShrimpDumplings, tialpiafishPorridge, tunaandCarrotSteam, yellowSteamedRiceChickenLiverStew, beefSteamed, steamedSoySauceChicken, steamedRiceChickenMushroom, riceBall, steamedGuremeRice, steamChickenStew, potatoEggSteam, bitterballen, chickenKatsuRice, savoryRiceWithStirFriedFishBallsAndBroccoli, riceChickenMushroom, chickenSoup, stirFriedTofuShrimp, mixedEggRice, friedNoodlesQuailEggs, steamedRiceWithEggAndBeef]
        tomato.menus = [cheeseGurameRice, tunaEggplantTomatoPorridge, smokedMeatPotatoFrittata, fishNuggetBun, steamedRiceWithFishEggsVegetables, soybeanPumpkinPorridge, steamedChickenLiverPorridgeinBananaLeaf, steamedLongJawedMackerelPorridgeinBananaLeaf, shrimpTofuPorridge, catfishPorridge, tofuandCatfishPorridge, snapperfishPorridge, beefSotoSteam, yellowSteamedRiceChickenLiverStew, beefTempehStew, beefLiverSambalSteamed, steamedGuremeRice, beefStirFryRice, riceWithButterFriedDuck, chickenSoup]
        greenBeans.menus = [chickenKatsuRice, tempehRicePorridge, redRiceTunaPorridge, quailEggandChickenLiverPorridge, shrimpGreenbeansPorridge, mackerelPorridge, redBeanSoupPorridge]
        broccoli.menus = [chickenMeatballSoup, potatoMeatBroccoliEggplantPorridge, doriFishAndBroccoliPorridge, doriFishPorridge, greenRicePorridge, chickenBreastandLiverPorridge, beefandEggPorridge, tofuandCatfishPorridge, broccoliShrimpSteamed, savoryRiceWithStirFriedFishBallsAndBroccoli, steamedMackerelStirFry, steamedMackerelStirFry, potatoBeefSteam, macaroniSteam, riceChickenMushroom]
        potato.menus = [tunaEggplantTomatoPorridge, potatoMeatBroccoliEggplantPorridge, doriFishAndBroccoliPorridge, smokedMeatPotatoFrittata, potatoChickenAndQuailEggPudding, beefCroquettes, potatoandChickenliverPorridge, doriPotatoCheese, beefLiverSambalSteamed, potatoBeefSteam, potatoEggSteam, cheesePotatoBalls]
        chicken.menus = [achovyandchickenPorridge, chickenMeatballSoup, peanutButterNoodle, mincedChickenCauliflowerTeam, redRiceChickenPorridge, greenRicePorridge, potatoChickenAndQuailEggPudding, redBeanSoupPorridge, chickenBreastandLiverPorridge, chickenLemper, chickenKatsuRice, chickenandShrimpDumplings, beefTempehStew, steamedChickenRice, steamedSoySauceChicken, steamedRiceChickenMushroom, riceBall, steamChickenStew, potatoEggSteam, chickenNoodleSteam, macaroniSteam, stirFriedNoodlesStreetStyle, riceChickenMushroom, chickenSoup, mixedEggRice, chickenSatay, riceWithFriedChickenGalangal, chickenSotoPorridge]
        tofu.menus = [carpMustardPorridge, tunaEggplantTomatoPorridge, eggTofuOkraSoup, steamedRiceVermicelliTofuTempeh, soyMilkPorridge, potatoChickenAndQuailEggPudding, chickenSotoPorridge, tofuFritters, steamedRiceWithShrimpInBananaLeaves, chickenBreastandLiverPorridge, shrimpTofuPorridge, stirFriedTofuShrimp, tofuandCatfishPorridge, riceBall, steamChickenStew, stuffedTofuWithSausage]
        shrimp.menus = [steamedRiceWithShrimpInBananaLeaves, shrimpTofuPorridge, shrimpGreenbeansPorridge, shrimpandCoconutMilkPorridge, chickenandShrimpDumplings, broccoliShrimpSteamed, shrimpFriedRice, stirFriedTofuShrimp, friedNoodlesQuailEggs, shrimpMeatballs]
        mincedBeef.menus = [friedOkra, tempehRicePorridge, redBeanRicePorridge, tofuFritters, beefandEggPorridge, beefGadonRice, beefPorridge, cheeseMacaroni, beefSotoSteam, beefTempehStew, beefSteamed, potatoBeefSteam, bitterballen, beefStirFryRice, steamedRiceWithEggAndBeef, beefCroquettes, tempeRoll]
        tempeh.menus = [abonLele, steamedRiceVermicelliTofuTempeh, soyMilkPorridge, tempehRicePorridge, menadoPorridge, snapperfishPorridge, yellowSteamedRiceChickenLiverStew, beefTempehStew, riceWithRendangEggAndTempeh]
        catfish.menus = [catfishPorridge, tofuandCatfishPorridge, abonLele]
        egg.menus = [achovyandchickenPorridge, chickenMeatballSoup, friedOkra, smokedMeatPotatoFrittata, fishNuggetBun, steamedRiceWithEggVermicelli, macaroniMilkPorridge, redBeanSoupPorridge, tofuFritters, steamedRiceWithShrimpInBananaLeaves, chickenButterPorridge, beefandEggPorridge, tofuandCatfishPorridge, cheeseBreadSteam, cheeseMacaroni, steamedRiceWithEggAndBeef, riceWithRendangEggAndTempeh, beefSotoSteam, doriPotatoCheese, riceBall, potatoEggSteam, chickenNoodleSteam, mackerelBalls, bitterballen, cheesePotatoBalls, chickenKatsuRice, beefGadonRice, stirFriedNoodlesStreetStyle, shrimpFriedRice, stirFriedTofuShrimp, mixedEggRice, shrimpMeatballs, beefCroquettes, stuffedTofuWithSausage, tempeRoll]
        butter.menus = [achovyandchickenPorridge, taroCheeseRollCake, doriFishAndBroccoliPorridge, chickenButterPorridge, butterDuckPure, beefandEggPorridge, cheeseBreadSteam, riceWithButterFriedDuck, chickenSoup, chickenSatay, beefCroquettes]
        cheese.menus = [dateBreadPudding, cheeseGurameRice, taroCheeseRollCake, thailandCassava, smokedMeatPotatoFrittata, steamedCassavaMixedWithCheese, macaroniMilkPorridge, milkOatCheesePorridge, spinachCheeseMilkPorridge, tempehRicePorridge, cheeseBreadSteam, cheeseMacaroni, doriPotatoCheese, macaroniSteam, mackerelBalls, bitterballen, cheesePotatoBalls]
        whiteBread.menus = [dateBreadPudding, cheeseBreadSteam, mackerelBalls, shrimpMeatballs]

        jellyPowder.menus = [durianPudding, melonPudding, vanillaMilkPudding, chocolateMilkPudding, fruitJelly]
        chickenBroth.menus = [steamedRiceWithStirFriedFish, steamedRiceWithFishEggsVegetables, mincedChickenCauliflowerTeam, steamedCornVegetables, steamedRiceWithEggVermicelli, redBeanSoupPorridge, chickenBreastandLiverPorridge, mackerelPorridge, steamedChickenRice, broccoliShrimpSteamed, beefSteamed, steamedSoySauceChicken, steamedMackerelStirFry, steamedRiceChickenMushroom, steamChickenStew, chickenNoodleSteam]
        candlenut.menus = [meatballCurry, chickenCurryPorridge, beefGadonRice, shrimpTofuPorridge, beefSotoSteam, beefLiverSambalSteamed, tunaSteam, chickenLemper, stirFriedNoodlesStreetStyle, riceWithRendangEggAndTempeh, chickenSatay]
        flour.menus = [bitterballen, cheesePotatoBalls, shrimpMeatballs, beefCroquettes, tempeRoll, fishNuggetBun]
        eggNoodle.menus = [peanutButterNoodle, chickenNoodleSteam, stirFriedNoodlesStreetStyle, friedNoodlesQuailEggs]
        tunaFish.menus = [tunaEggplantTomatoPorridge, redRiceTunaPorridge, tunaandCarrotSteam, tunaSteam, grilledRiceWithTuna]
        blackJellyMushroom.menus = [steamedRiceChickenMushroom, riceChickenMushroom, stirFriedTofuShrimp]

        // udah
        fishBroth.menus = [redRicePorridge, snapperfishPorridge, greenRicePorridge]
        pear.menus = [pearPure, orangeAndPearPure, mixedFruitMilkPorridge]
        orange.menus = [fruitIce, mixedFruitMilkPorridge, redBeanSoupPorridge, orangeandAvocadoPure, datesAndBananaPure, papayaAndWatermelonPure, orangeAndPearPure, strawberryAndBananaPure]
        riceFlour.menus = [ricePorridgeWithDateSyrup, spinachCheeseMilkPorridge, combinationVegetablePorridge, milkMarrowPorridge, sweetAppleMilkPorridge]
        snapperFish.menus = [combinationVegetablePorridge, snapperfishPorridge, snapperPumpkinPorridge, redRicePorridge]
        apple.menus = [oatPorridgeWithFruit, appleandBananaPure, sweetAppleMilkPorridge, fruitIce]
        banana.menus = [steamedCassavaMixedWithCheese, mixedFruitMilkPorridge, oatPorridgeWithFruit, appleandBananaPure, datesAndBananaPure, strawberryAndBananaPure]
        oatFlour.menus = [mackerelBalls, oatMilkPorridge, milkOatCheesePorridge]
        mungBeans.menus = [cornMungBeansPorridge, sweetPotatoMungBeansPorridge, greenBeanBiscuitMilkPorridge]
        redBeans.menus = [achovyandchickenPorridge, redRicePorridge, redBeanRicePorridge, redBeanSoupPorridge]
        ubi.menus = [sweetPotatoAndSpinachPure, sweetPotatoMungBeansPorridge, sweetCornAndSweetPotatoPorridge, bananaSweetPotatoBallsYoghurtSauce]
        corn.menus = [menadoPorridge, sweetCornAndSweetPotatoPorridge, steamedCornVegetables, caisimBabyCornTauco]
        waterGourd.menus = [redRiceChickenPorridge, chickenSotoPorridge, combinationVegetablePorridge]
        peas.menus = [shrimpFriedRice, vegetablePure, greenRicePorridge, macaroniMilkPorridge, friedRice]
        macaroni.menus = [cheeseMacaroni, macaroniSteam, macaroniMilkPorridge]
        quail.menus = [eggTofuOkraSoup, potatoChickenAndQuailEggPudding, quailEggandChickenLiverPorridge, friedNoodlesQuailEggs, steamedRiceWithFishEggsVegetables]
        soyBeans.menus = [steamedCassavaMixedWithCheese, soyBeanPorridge, soyMilkPorridge]
        mackarel.menus = [mackerelBalls, steamedFishCake, curryFishTeam]
        banana.menus = [yogurtBananaStrawberryCake, bananaSweetPotatoBallsYoghurtSauce]
        yogurt.menus = [appleandBananaPure, yogurtBananaStrawberryCake, bananaSweetPotatoBallsYoghurtSauce]
        tilapiaFish.menus = [fishNuggetBun, steamedRiceWithStirFriedFish, tialpiafishPorridge]
        longJawedMackerel.menus = [steamedLongJawedMackerelPorridgeinBananaLeaf, steamedRiceWithFishEggsVegetables, yellowPumpkinFishMeatballs]
        cabbage.menus = [smokedMeatPotatoFrittata, vegetablePure, mincedChickenCauliflowerTeam]
        fishBalls.menus = [savoryRiceWithStirFriedFishBallsAndBroccoli, friedRice, caisimBabyCornTauco]
        meat.menus = [potatoMeatBroccoliEggplantPorridge, beefCroquettes, beefSotoSteam, beefTempehStew]
        ricePorridge.menus = [chickenSotoPorridge, redBeanSoupPorridge, potatoandChickenliverPorridge]
        papaya.menus = [mixedFruitMilkPorridge, oatPorridgeWithFruit, papayaAndWatermelonPure, cornMungBeansPorridge]
        pumpkin.menus = [spinachCheeseMilkPorridge, snapperPumpkinPorridge, soybeanPumpkinPorridge, menadoPorridge, yellowPumpkinFishMeatballs]
        ricePorridge.menus = [chickenSotoPorridge, redBeanSoupPorridge, greenRicePorridge]
        avocado.menus = [orangeandAvocadoPure, avocadoPure, melonAvocadoPure]
        strawberry.menus = [strawberryAndBananaPure, yogurtBananaStrawberryCake, strawberryPure]
        beefLiver.menus = [beefLiverPorridge, beefLiverSambalSteamed, beefLiverPure]
        duck.menus = [braisedDuckRice, riceWithButterFriedDuck, butterDuckPure]
        bihun.menus = [steamedRiceWithEggVermicelli, steamedRiceVermicelliTofuTempeh]
        eggYolk.menus = [vanillaMilkPudding, melonPudding, durianPudding, taroEggYolkPuree]
        watermelon.menus = [fruitJelly, papayaAndWatermelonPure, fruitIce]
        okra.menus = [friedOkra, eggTofuOkraSoup, spinachOkraPorridge]
        cassava.menus = [cassavaPorridge, steamedCassavaMixedWithCheese, thailandCassava]
        cucumber.menus = [vegetablePure, fishNuggetBun, cucumberPure]
        dori.menus = [doriPotatoCheese, doriFishPorridge, doriFishAndBroccoliPorridge]
        peanuts.menus = [chickenSatay, peanutButterJam, peanutButterNoodle]
        taro.menus = [taroPure, taroEggYolkPuree, taroCheeseRollCake]
        eggPlant.menus = [tunaEggplantTomatoPorridge, boborTerung, potatoMeatBroccoliEggplantPorridge]
        glutinousRice.menus = [chickenLemper, mangoStickyRice, stickyRiceBrownSugarPorridge]
        taro.menus = [taroPure, taroEggYolkPuree, taroCheeseRollCake]
        saltedFish.menus = [menadoPorridge, chickenMeatballSoup, achovyandchickenPorridge]
        carp.menus = [carpMustardPorridge, steamedGuremeRice, cheeseGurameRice]
        meatball.menus = [friedRice, chickenMeatballSoup, meatballCurry]
        Dates.menus = [dateBreadPudding, ricePorridgeWithDateSyrup, datesAndBananaPure]


        return [chickenLiver, duck, beefLiver, mincedBeef, tofu, shrimp, catfish, longJawedMackerel, quail, egg, tilapiaFish, snapperFish, chickenBroth, fishBroth, yogurt, whiteBread, macaroni, candlenut, cheese, tunaFish, dori, fishBalls, peas, tempeh, mungBeans, soyBeans, redBeans, peanuts, potato, eggNoodle, oatFlour, glutinousRice, jellyPowder, bihun, ricePorridge, macaroni, whiteRice, whiteBread, cassava, taro, riceFlour, flour, ubi, coconutOil, coconutMilk, cornOil, canolaOil, soybeanOil, sesameOil, butter, candlenut, meat, saltedFish, carp, tilapiaFish, meatball, eggYolk, chicken, okra, cucumber, avocado, blackJellyMushroom, blackJellyMushroom, waterGourd, eggPlant, corn, cabbage, Dates, pear, watermelon, broccoli, carrot, tomato, greenBeans, mackarel, orange, banana, apple, spinach, pumpkin, strawberry, papaya]
    }

    static func getExistingIngredients(context: ModelContext) -> [Ingredient] {
        let descriptor = FetchDescriptor<Ingredient>()
        
        if let allIngredients = try? context.fetch(descriptor) {
            return allIngredients.filter { $0.isSafeToShow }  // Filter out allergenic ingredients
        }
        
        return []
    }

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

func linkIngredientsAndAllergens(ingredients: [Ingredient], allergens: [Allergen]) {
    for ingredient in ingredients {
        ingredient.allergens?.forEach { allergen in
            if allergen.ingredients == nil {
                allergen.ingredients = []
            }
            if !(allergen.ingredients?.contains(ingredient) ?? false) {
                allergen.ingredients?.append(ingredient)
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

