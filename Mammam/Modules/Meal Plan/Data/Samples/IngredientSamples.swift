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
            
        let chicken = Ingredient(
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
        let carrot = Ingredient(name: "Carrot", image: "i_carrot", nutrients: [micro].compactMap { $0 })
        let tomato = Ingredient(name: "Tomato", image:"i_tomato", nutrients: [micro].compactMap { $0 })
        let greenBeans = Ingredient(name: "Green Beans", image:"i_greenbeans", nutrients: [micro].compactMap { $0 })
        let mackarel = Ingredient(name: "Mackerel", image: "i_mackerel", nutrients: [protein, fat].compactMap { $0 })
        let orange =  Ingredient(name: "Orange", image: "i_orange", nutrients: [micro].compactMap { $0 })
        let banana = Ingredient(name: "Banana", image: "i_banana", nutrients: [micro].compactMap { $0 })
        let apple = Ingredient(name: "Apple", image: "i_apple", nutrients: [micro].compactMap { $0 })
                
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
                let chickenLiverPorridge = FoodMenu(
                            name: "Chicken Liver Porridge",
                            image: "i_chickenliverporridge",
                            isSaved: false,
                            desc: "60 grams of rice\n30 grams of minced chicken liver\n10 grams of spinach\n7,5ml corn oil,to saute\n½ clove of garlic\n½ shallot\n½ piece of ginger\nSalt to taste (if needed)",
                            ingredients: [whiteRice,chickenLiver, whiteRice, cornOil, spinach],
                            allergens: [].compactMap { $0 }
                        )

                let chickenLiverPorridgeWithCoconutMilk = FoodMenu(
                    name: "Chicken Liver Porridge With Coconut Milk",
                    image: "i_chickenliverporridgewithcoconutmilk",
                    isSaved: false,
                    desc: "60 grams of rice\n30 grams of minced chicken liver\n1 tbsp of grated carrot\n7,5ml coconut milk\n7,5ml coconut oil,to saute\n½ clove of garlic\n½ shallot\nWater as required\nSalt to taste (if needed)",
                    ingredients: [whiteRice,chickenLiver, whiteRice, coconutMilk, coconutOil, carrot],
                    allergens: [].compactMap { $0 }
                )

                let steamedChickenLiverPorridgeinBananaLeaf = FoodMenu(
                    name: "Steamed Chicken Liver Porridge in Banana Leaf",
                    image: "i_steamedchickenliverporridgeinbananaleaf",
                    isSaved: false,
                    desc: "60 grams of rice\n40 grams of minced chicken liver\n1 tbsp of grated carrot\n7,5ml coconut milk\n10 grams of tomato\n1 lime leaf\n1 bay leaf\nBasil leaves as needed\n½ clove of garlic\n½ shallot\n⅓cm of ginger\nTurmeric, galangal, and lemongrass as needed\nSalt and Sugar to taste (if needed)",
                    ingredients: [whiteRice,chickenLiver, tomato, whiteRice,tomato,carrot,coconutMilk],
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
                            ingredients: [potato, chickenLiver, carrot],
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
                        ingredients: [whiteRice,mincedBeef, egg, broccoli, sesameOil, butter],
                        allergens: [soyAllergen, eggAllergen, dairyAllergen].compactMap { $0 }
                    )
                    
                    let shrimpTofuPorridge = FoodMenu(
                                name: "Shrimp Tofu Porridge",
                                image: "i_shrimptofuporridge",
                                isSaved: false,
                                desc: "60 grams of rice\n45 grams of ground shrimp\n20 grams of tofu,cut into small pieces\n10 grams of tomato, cut into small pieces\nBasil leaves, bay leaves, and lime to taste\nSalt and Sugar to taste (if needed)\n½ clove of garlic\n1 shallot\n1 candlenut\n⅓cm of ginger",
                                ingredients: [whiteRice,shrimp, coconutMilk, tofu,tomato,candlenut],
                                allergens: [soyAllergen, shellfishAllergen].compactMap { $0 }
                            )
                            
                           
                    let shrimpGreenbeansPorridge = FoodMenu(
                                name: "Shrimp Green Beans Porridge",
                                image: "i_shrimpgreenbeansporridge",
                                isSaved: false,
                                desc: "60 grams of rice\n40 grams of ground shrimp\n10 grams of green beans, cut into small pieces\n7.5 ml of corn oil, for sautéing\nLime to taste\nBasil leaves, bay leaves to taste\n½ clove of garlic\n½ shallot\nSalt to taste (if needed)",
                                ingredients: [whiteRice,shrimp, greenBeans, cornOil],
                                allergens: [soyAllergen, shellfishAllergen ].compactMap { $0 }
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
                        ingredients: [whiteRice, chickenLiver, catfish, tomato,cornOil],
                        allergens: [fishAllergen, shellfishAllergen].compactMap { $0 }
                    )

                    //belum : gambar
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
                        ingredients: [whiteRice, tilapiaFish, chickenLiver, carrot,canolaOil],
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
                        ingredients: [apple,banana, yogurt],
                        allergens: [].compactMap { $0 }
                    )

                    let vanillaMilkPudding = FoodMenu(
                        name: "Vanilla Milk Pudding",
                        image: "i_vanillamilkpudding",
                        isSaved: false,
                        desc: "60 grams of eggyolk\n800 ml of milk\n100 grams of sugar\n½ tsp of vanilla paste\n1 pack of jelly powder\n1/2 tsp of salt (if needed)",
                        ingredients: [eggYolk,jellyPowder],
                        allergens: [dairyAllergen].compactMap { $0 }
                    )
        
                    let cheeseBreadSteam = FoodMenu(
                        name: "Cheese Bread Steam",
                        image: "i_cheesebreadsteam",
                        isSaved: false,
                        desc: "2 slices of white bread\n125 ml of milk\n½ egg\n50 grams of grated cheese\n1½ tsp of melted butter\nvanilli powder (if needed)",
                        ingredients: [whiteBread, egg ,cheese, butter],
                        allergens: [dairyAllergen].compactMap { $0 }
                    )
        
                    let cheeseMacaroni = FoodMenu(
                        name: "Cheese Macaroni",
                        image: "i_cheesemacaroni",
                        isSaved: false,
                        desc: "150 grams of macaroni\n60 grams of minced beef\n1½ egg\n1 tbsp of grated cheese\n7.5 ml coconut oil\nsalt (if needed)\n1 clove of garlic\n½ onion",
                        ingredients: [macaroni, mincedBeef,egg, cheese, coconutOil],
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
                        ingredients: [mincedBeef, whiteRice, egg, tomato, candlenut],
                        allergens: [eggAllergen].compactMap { $0 }
                    )

                    let doriPotatoCheese = FoodMenu(
                        name: "Dori Potato with Cheese Sauce",
                        image: "i_doripotatocheese",
                        isSaved: false,
                        desc: "50 grams of dori fish\n150 grams of potato\n40 grams of grated cheese\nBreadcrumbs to taste\nCHEESE SAUCE:\n40 ml UHT full cream milk\n50 ml water for boiling\n1 egg yolk\n2 tbsp cornstarch\nGrated cheese to taste",
                        ingredients: [dori, potato, cheese,  egg],
                        allergens: [fishAllergen, dairyAllergen, eggAllergen, glutenAllergen].compactMap { $0 }
                    )

                    let yellowSteamedRiceChickenLiverStew = FoodMenu(
                        name: "Yellow Steamed Rice with Chicken Liver Stew",
                        image: "i_yellowricechickenliver",
                        isSaved: false,
                        desc: "YELLOW RICE:\n60 grams of rice\n200 ml water\n1 1/2 tbsp grated carrot\n20 grams of tempeh, cut into small pieces\n1 tsp turmeric powder\n2 bay leaves\n1 shallot (mashed)\n1 stalk of green onion, cut into small pieces\n1 stalk of celery, cut into small pieces\nCHICKEN LIVER STEW:\n40 grams of chicken liver, cut into small pieces\n1 garlic clove (mashed)\nTomato (mashed)\n1/4 tsp turmeric powder\n1 tsp sweet soy sauce\n10 ml corn oil (for sautéing)\nSalt and sugar to taste (if needed)",
                        ingredients: [whiteRice, carrot, tempeh, chickenLiver,tomato, cornOil],
                        allergens: [soyAllergen].compactMap { $0 }
                    )

                    let beefTempehStew = FoodMenu(
                        name: "Beef and Tempeh Stew",
                        image: "i_beeftempestew",
                        isSaved: false,
                        desc: "75 grams of rice\n60 grams of beef, diced\n20 grams of tempeh, cut into small pieces\n7.5 ml corn oil\n20 grams of tomato\nLime juice\n1/4 tsp sweet soy sauce\n1/4 tsp salt\n1 shallot\n1/2 garlic clove",
                        ingredients: [mincedBeef, whiteRice, tempeh, cornOil, tomato],
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
                        ingredients: [whiteRice, mincedBeef, chickenBroth, carrot,sesameOil],
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
                        ingredients: [whiteRice,mackarel, broccoli, chickenBroth, cornOil, sesameOil],
                        allergens: [fishAllergen, soyAllergen].compactMap { $0 }
                    )

                    let steamedRiceChickenMushroom = FoodMenu(
                        name: "Steamed Rice Chicken Mushroom",
                        image: "i_steamedricechickenmushroom",
                        isSaved: false,
                        desc: "120 grams of rice\n60 grams of chicken, diced\n20 grams of straw mushrooms, sliced\n1½ tablespoons of grated carrot\n1 teaspoon of sesame oil\n1 teaspoon of sweet soy sauce\n½ teaspoon of soy sauce\n100 ml of chicken stock\n10 ml of palm oil (for sautéing)\n\nBLENDED SPICES:\n1 shallot\n1 clove of garlic\n½ cm of ginger\nSalt and pepper to taste",
                        ingredients: [whiteRice, chicken,blackJellyMushroom, carrot, sesameOil, chickenBroth],
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
                    desc: """
                    90 grams of rice\n
                    60 grams of minced chicken\n
                    30 grams of tofu, minced\n
                    1½ tbsp grated carrot\n
                    2 tbsp sweet soy sauce\n
                    75 ml chicken broth\n
                    10 ml corn oil (for sautéing)\n
                    Salt to taste\n
                    Seasoning:\n
                    1 shallot\n
                    1 clove of garlic\n
                    """,
                    ingredients: [whiteRice, chicken, tofu, carrot, chickenBroth, cornOil],
                    allergens: [soyAllergen].compactMap { $0 }
                )

                let potatoEggSteam = FoodMenu(
                    name: "Potato Egg Steam",
                    image: "i_potatoeggsteam",
                    isSaved: false,
                    desc: """
                    150 grams of boiled potatoes, mashed\n
                    50 grams of minced chicken, boiled\n
                    1½ tbsp grated carrot\n
                    1 egg, beaten\n
                    10 grams of margarine\n
                    Salt to taste\n
                    """,
                    ingredients: [potato, chicken, carrot, egg],
                    allergens: [eggAllergen].compactMap { $0 }
                )

                let chickenNoodleSteam = FoodMenu(
                    name: "Chicken Noodle Steam",
                    image: "i_chickennoodlesteam",
                    isSaved: false,
                    desc: """
                    150 grams of egg noodles, boiled until cooked\n
                    75 grams of minced chicken\n
                    1 egg, beaten\n
                    200 ml chicken broth\n
                    1 tsp soy sauce\n
                    1 tsp sweet soy sauce\n
                    30 grams of mustard greens, chopped small\n
                    10 ml canola oil\n
                    Celery leaves, finely chopped\n
                    Seasoning:\n
                    1 shallot\n
                    1 clove of garlic\n
                    """,
                    ingredients: [eggNoodle, chicken, egg, chickenBroth, canolaOil],
                    allergens: [soyAllergen, eggAllergen].compactMap { $0 }
                )

                let macaroniSteam = FoodMenu(
                    name: "Macaroni Steam",
                    image: "i_macaronisteam",
                    isSaved: false,
                    desc: """
                    50 grams of macaroni (uncooked), boiled until soft\n
                    60 grams of minced chicken\n
                    30 grams of broccoli, finely chopped\n
                    1 tbsp chopped onion\n
                    50 ml cow’s milk\n
                    10 ml canola oil (for sautéing)\n
                    Grated cheese to taste\n
                    Salt to taste\n
                    Seasoning:\n
                    1 shallot\n
                    1 clove of garlic\n
                    """,
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
                    ingredients: [mincedBeef, flour,carrot, egg,cheese],
                    allergens: [glutenAllergen, dairyAllergen, eggAllergen].compactMap { $0 }
                )

                let chickenLemper = FoodMenu(
                    name: "Chicken Lemper",
                    image: "i_chickenlemper",
                    isSaved: false,
                    desc: "100 grams of cooked sticky rice\n75 ml of coconut milk\n75 grams of chopped chicken\n2 kaffir lime leaves\n1 bay leaf\n½ stalk of lemongrass, bruised\n10 ml of corn oil for sautéing\nSalt to taste\nSugar to taste\nBanana leaves for wrapping\n2 cloves of garlic\n2 shallots\n1 roasted candlenut\nCoriander to taste",
                    ingredients: [glutinousRice, coconutMilk, chicken,  cornOil, candlenut],
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
                    ingredients: [whiteRice, chicken, carrot,tomato, butter],
                    allergens: [dairyAllergen].compactMap { $0 }
                )

                let stirFriedTofuShrimp = FoodMenu(
                    name: "Stir-Fried Tofu and Shrimp",
                    image: "i_stirfriedtofushrimp",
                    isSaved: false,
                    desc: "150 grams of rice\n75 grams of shrimp\n200 grams of silken tofu, diced\n2 pieces of cloud ear mushrooms, sliced\n1 egg, beaten\n1 1/2 tbsp grated carrot\n1/2 tbsp fish sauce\n1 tsp sesame oil\n1 stalk of green onion, chopped\n30 ml water\n1 tbsp cornstarch\n15 ml soybean oil\nSalt to taste\n1/2 onion\n1 clove of garlic",
                    ingredients: [whiteRice, shrimp, tofu, blackJellyMushroom, egg, carrot,  sesameOil, soybeanOil],
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
                    ingredients: [eggNoodle, quail, shrimp, carrot,cornOil],
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
                    ingredients: [whiteRice, mincedBeef, carrot, egg,  sesameOil, canolaOil],
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
                    ingredients: [chicken,coconutOil],
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
                    ingredients: [potato, mincedBeef, carrot, flour, butter, egg],
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
                    ingredients: [tempeh, mincedBeef, egg,flour],
                    allergens: [glutenAllergen, eggAllergen, soyAllergen].compactMap { $0 }
                )


        // Connect menus to egg ingredient
        chickenLiver.menus = [chickenLiverPorridge, chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, quailEggandChickenLiverPorridge, potatoandChickenliverPorridge, chickenBreastandLiverPorridge, catfishPorridge,yellowSteamedRiceChickenLiverStew]
        whiteRice.menus = [shrimpFriedRice,chickenLiverPorridge, chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, steamedLongJawedMackerelPorridgeinBananaLeaf, beefandEggPorridge, shrimpTofuPorridge, shrimpGreenbeansPorridge, shrimpandCoconutMilkPorridge, catfishPorridge, tofuandCatfishPorridge, beefLiverPorridge, tialpiafishPorridge, snapperfishPorridge, tunaandCarrotSteam, tunaSteam,riceBall,steamedGuremeRice, riceWithButterFriedDuck,savoryRiceWithStirFriedFishBallsAndBroccoli, beefSotoSteam,yellowSteamedRiceChickenLiverStew,beefTempehStew,steamedChickenRice,broccoliShrimpSteamed,beefSteamed,steamedSoySauceChicken,steamedMackerelStirFry,steamedRiceChickenMushroom,steamChickenStew,riceChickenMushroom, chickenSoup,stirFriedTofuShrimp,mixedEggRice,grilledRiceWithTuna,steamedRiceWithShrimpInBananaLeaves,steamedRiceWithEggAndBeef,riceWithRendangEggAndTempeh]
        coconutMilk.menus = [chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, shrimpTofuPorridge, shrimpandCoconutMilkPorridge,riceWithRendangEggAndTempeh, steamedFishCake , beefGadonRice,beefLiverPorridge,steamedChickenRice,savoryRiceWithStirFriedFishBallsAndBroccoli,beefLiverSambalSteamed, tunaSteam,chickenLemper ]
        cornOil.menus = [stuffedTofuWithSausage,tofuFritters,chickenLiverPorridge, mixedEggRice,steamedLongJawedMackerelPorridgeinBananaLeaf, shrimpGreenbeansPorridge, tunaandCarrotSteam,beefTempehStew,steamedChickenRice,broccoliShrimpSteamed,steamedSoySauceChicken,steamedMackerelStirFry, tunaSteam, potatoBeefSteam ,steamChickenStew,riceChickenMushroom,mackerelBalls,chickenLemper,cheesePotatoBalls ,braisedDuckRice,friedNoodlesQuailEggs,grilledRiceWithTuna]
        coconutOil.menus = [chickenLiverPorridgeWithCoconutMilk, mackerelPorridge, tofuandCatfishPorridge, beefPorridge,yellowSteamedRiceChickenLiverStew,broccoliShrimpSteamed,chickenSatay,riceWithFriedChickenGalangal]
        canolaOil.menus = [chickenBreastandLiverPorridge, tialpiafishPorridge,steamedGuremeRice,chickenNoodleSteam,macaroniSteam,steamedRiceWithEggAndBeef]
        soybeanOil.menus = [shrimpMeatballs,snapperfishPorridge,steamedChickenRice,beefLiverSambalSteamed,riceBall,stirFriedTofuShrimp,steamedRiceWithShrimpInBananaLeaves]
        sesameOil.menus = [beefandEggPorridge,beefSteamed,steamedMackerelStirFry,braisedDuckRice, steamedRiceChickenMushroom, riceWithButterFriedDuck,stirFriedTofuShrimp,steamedRiceWithEggAndBeef]
        spinach.menus = [chickenLiverPorridge, beefPorridge, beefLiverPorridge,grilledRiceWithTuna]
        carrot.menus = [beefCroquettes,tofuFritters,chickenLiverPorridgeWithCoconutMilk, steamedChickenLiverPorridgeinBananaLeaf, potatoandChickenliverPorridge, chickenButterPorridge, chickenCurryPorridge, shrimpandCoconutMilkPorridge, chickenandShrimpDumplings, tialpiafishPorridge, tunaandCarrotSteam,yellowSteamedRiceChickenLiverStew,beefSteamed,steamedSoySauceChicken,steamedRiceChickenMushroom,riceBall,steamedGuremeRice,steamChickenStew,potatoEggSteam,bitterballen,chickenKatsuRice,savoryRiceWithStirFriedFishBallsAndBroccoli,riceChickenMushroom, chickenSoup,stirFriedTofuShrimp,mixedEggRice,friedNoodlesQuailEggs,steamedRiceWithEggAndBeef]
        tomato.menus = [steamedChickenLiverPorridgeinBananaLeaf, steamedLongJawedMackerelPorridgeinBananaLeaf, shrimpTofuPorridge, catfishPorridge, tofuandCatfishPorridge, snapperfishPorridge, beefSotoSteam,yellowSteamedRiceChickenLiverStew,beefTempehStew,beefLiverSambalSteamed,steamedGuremeRice,beefStirFryRice, riceWithButterFriedDuck, chickenSoup]
        greenBeans.menus = [quailEggandChickenLiverPorridge, shrimpGreenbeansPorridge, mackerelPorridge]
        broccoli.menus = [chickenBreastandLiverPorridge, beefandEggPorridge, tofuandCatfishPorridge,broccoliShrimpSteamed,savoryRiceWithStirFriedFishBallsAndBroccoli,steamedMackerelStirFry,steamedMackerelStirFry, potatoBeefSteam,macaroniSteam,riceChickenMushroom]
        avocado.menus = [orangeandAvocadoPure]
        orange.menus = [orangeandAvocadoPure]
        apple.menus = [appleandBananaPure]
        banana.menus = [appleandBananaPure]
        quail.menus = [quailEggandChickenLiverPorridge,friedNoodlesQuailEggs]
        longJawedMackerel.menus = [steamedLongJawedMackerelPorridgeinBananaLeaf]
        potato.menus = [beefCroquettes,potatoandChickenliverPorridge,doriPotatoCheese,beefLiverSambalSteamed, potatoBeefSteam,potatoEggSteam,cheesePotatoBalls ]
        chicken.menus = [chickenBreastandLiverPorridge,chickenLemper ,chickenKatsuRice, chickenandShrimpDumplings,beefTempehStew,steamedChickenRice,steamedSoySauceChicken,steamedRiceChickenMushroom,riceBall,steamChickenStew,potatoEggSteam,chickenNoodleSteam,macaroniSteam,stirFriedNoodlesStreetStyle,riceChickenMushroom, chickenSoup,mixedEggRice,chickenSatay,riceWithFriedChickenGalangal]
        tofu.menus = [tofuFritters,steamedRiceWithShrimpInBananaLeaves,chickenBreastandLiverPorridge, shrimpTofuPorridge,stirFriedTofuShrimp, tofuandCatfishPorridge,riceBall,steamChickenStew,stuffedTofuWithSausage]
        shrimp.menus = [steamedRiceWithShrimpInBananaLeaves,shrimpTofuPorridge, shrimpGreenbeansPorridge, shrimpandCoconutMilkPorridge, chickenandShrimpDumplings,broccoliShrimpSteamed,shrimpFriedRice,stirFriedTofuShrimp,friedNoodlesQuailEggs,shrimpMeatballs]
        mincedBeef.menus = [tofuFritters,beefandEggPorridge, beefGadonRice, beefPorridge, cheeseMacaroni, beefSotoSteam,beefTempehStew,beefSteamed, potatoBeefSteam,bitterballen,beefStirFryRice,steamedRiceWithEggAndBeef,beefCroquettes,tempeRoll]
        beefLiver.menus = [beefLiverPorridge,beefLiverSambalSteamed]
        tilapiaFish.menus = [tialpiafishPorridge]
        snapperFish.menus = [snapperfishPorridge]
        tempeh.menus = [snapperfishPorridge,yellowSteamedRiceChickenLiverStew,beefTempehStew,riceWithRendangEggAndTempeh]
        catfish.menus = [catfishPorridge, tofuandCatfishPorridge]
        egg.menus = [tofuFritters,steamedRiceWithShrimpInBananaLeaves,chickenButterPorridge, beefandEggPorridge, tofuandCatfishPorridge, cheeseBreadSteam, cheeseMacaroni,steamedRiceWithEggAndBeef,riceWithRendangEggAndTempeh, beefSotoSteam,doriPotatoCheese,riceBall,potatoEggSteam,chickenNoodleSteam,mackerelBalls,bitterballen,cheesePotatoBalls,chickenKatsuRice,beefGadonRice,stirFriedNoodlesStreetStyle,shrimpFriedRice,stirFriedTofuShrimp,mixedEggRice,shrimpMeatballs,beefCroquettes,stuffedTofuWithSausage,tempeRoll]
        eggYolk.menus = [vanillaMilkPudding]
        butter.menus = [chickenButterPorridge, beefandEggPorridge, cheeseBreadSteam, riceWithButterFriedDuck, chickenSoup,chickenSatay,beefCroquettes]
        cheese.menus = [cheeseBreadSteam, cheeseMacaroni, doriPotatoCheese,macaroniSteam,mackerelBalls,bitterballen,cheesePotatoBalls]
        yogurt.menus = [appleandBananaPure,yogurtBananaStrawberryCake]
        whiteBread.menus = [cheeseBreadSteam,mackerelBalls,shrimpMeatballs]
        macaroni.menus = [cheeseMacaroni,macaroniSteam]
        jellyPowder.menus = [vanillaMilkPudding,chocolateMilkPudding,fruitJelly]
        chickenBroth.menus = [chickenBreastandLiverPorridge, mackerelPorridge,steamedChickenRice,broccoliShrimpSteamed,beefSteamed,steamedSoySauceChicken,steamedMackerelStirFry,steamedRiceChickenMushroom,steamChickenStew,chickenNoodleSteam]
        fishBroth.menus = [snapperfishPorridge]
        candlenut.menus = [chickenCurryPorridge, beefGadonRice,shrimpTofuPorridge, beefSotoSteam,beefLiverSambalSteamed, tunaSteam,chickenLemper,stirFriedNoodlesStreetStyle,riceWithRendangEggAndTempeh,chickenSatay]
        lamb.menus = []
        duck.menus = [braisedDuckRice, riceWithButterFriedDuck]
        tunaFish.menus = [tunaandCarrotSteam, tunaSteam,grilledRiceWithTuna]
        dori.menus = [doriPotatoCheese]
        fishBalls.menus = [savoryRiceWithStirFriedFishBallsAndBroccoli]
        peas.menus = [shrimpFriedRice]
        mungBeans.menus = []
        soyBeans.menus = []
        redBeans.menus = []
        peanuts.menus = [chickenSatay]
        eggNoodle.menus = [chickenNoodleSteam,stirFriedNoodlesStreetStyle,friedNoodlesQuailEggs]
        oatFlour.menus = [mackerelBalls]
        glutinousRice.menus = [chickenLemper ]
        bihun.menus = []
        ricePorridge.menus = []
        cassava.menus = []
        taro.menus = []
        riceFlour.menus = []
        flour.menus = [bitterballen,cheesePotatoBalls,shrimpMeatballs,beefCroquettes,tempeRoll]
        ubi.menus = []
        squid.menus = []
        buffaloMeat.menus = []
        saltedFish.menus = []
        carp.menus = [steamedGuremeRice]
        clams.menus = []
        meatball.menus = []
        duckEgg.menus = []
        cucumber.menus = []
        blackJellyMushroom.menus = [steamedRiceChickenMushroom,riceChickenMushroom,stirFriedTofuShrimp]
        radish.menus = []
        waterGourd.menus = []
        eggPlant.menus = []
        babyCorn.menus = []
        cabbage.menus = []
        cassavaLeaves.menus = []
        grape.menus=[]
        langsat.menus=[]
        durian.menus=[]
        wateryRoseApples.menus=[]
        Dates.menus=[]
        pear.menus=[]
        watermelon.menus=[fruitJelly]
        snakeFruit.menus=[]
        mangosteen.menus=[]
        soursop.menus = []
        lychee.menus = []
        ambarella.menus = []
        greenBeans.menus = [chickenKatsuRice]
        mackarel.menus = [mackerelBalls, steamedFishCake ]
        orange.menus = []
        banana.menus = [yogurtBananaStrawberryCake]
        apple.menus = []
        
        
        
        

        return [chickenLiver, lamb, duck,  beefLiver,mincedBeef, tofu,shrimp,catfish,longJawedMackerel,quail,egg, tilapiaFish,snapperFish,chickenBroth, fishBroth, yogurt, whiteBread, macaroni, candlenut, cheese, tunaFish, dori, fishBalls, peas, tempeh, mungBeans,soyBeans,redBeans,peanuts, potato, eggNoodle, oatFlour, glutinousRice, jellyPowder, bihun, ricePorridge, macaroni, whiteRice, whiteBread, cassava, taro, riceFlour, flour, ubi, coconutOil, coconutMilk, cornOil,canolaOil, soybeanOil, sesameOil, butter, candlenut, squid, buffaloMeat, saltedFish, catfish, carp,tilapiaFish, clams, meatball, eggYolk, duckEgg, chicken, okra, cucumber, avocado, blackJellyMushroom, radish, blackJellyMushroom,waterGourd, eggPlant, babyCorn, cabbage, cassavaLeaves, grape,langsat, durian, wateryRoseApples, Dates,pear,watermelon,snakeFruit,mangosteen,soursop,lychee, ambarella, broccoli, carrot, tomato, greenBeans, mackarel, orange, banana, apple, spinach ]
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
