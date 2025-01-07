import Foundation
import SwiftData

@MainActor
class DataController {
    static let shared = DataController()
    var container: ModelContainer!
    
    private init() {
        do {
            let schema = Schema([
                Allergen.self,
                Ingredient.self,
                FoodMenu.self,
                Nutrient.self,
                Meal.self,
                Motivation.self,
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
    
    func initializeDataIfNeeded() {
        let context = container.mainContext
        
        do {
            // Check each entity type independently
//            try initializeNutrientsIfNeeded(context: context)
            try initializeAllergenIfNeeded(context: context)
            try initializeIngredientsIfNeeded(context: context)
//            try initializeFoodMenuIfNeeded(context: context)
            try initializeBabyIfNeeded(context: context)
            try initializeMotivationIfNeeded(context: context)
            try initializeArticleIfNeeded(context: context)
            
        } catch {
            print("Failed to initialize data: \(error)")
        }
    }

//    private func initializeNutrientsIfNeeded(context: ModelContext) throws {
//        let nutrientsFetch = FetchDescriptor<Nutrient>()
//        let existingNutrients = try context.fetch(nutrientsFetch)
//            
//        if existingNutrients.isEmpty {
//            let nutrients = Nutrient.sampleNutrients
//            nutrients.forEach { context.insert($0) }
//            try context.save()
//            print("Nutrients initialized")
//        }
//    }
        
//    private func initializeFoodMenuIfNeeded(context: ModelContext) throws {
//        let foodMenuFetch = FetchDescriptor<FoodMenu>()
//        let existingFoodMenus = try context.fetch(foodMenuFetch)
//            
//        if existingFoodMenus.isEmpty {
//            let foodMenus = FoodMenu.sampleIngredient
//            foodMenus.forEach { context.insert($0) }
//            try context.save()
//            print("FoodMenu initialized")
//        }
//    }
    
//    func initializeFoodMenusAndAllergens(context: ModelContext) {
//        // Fetch or create allergens and menus
//        let existingAllergens = Allergen.sampleAllergens
//        let existingMenus = FoodMenu.getExistingMenus(context: context)
//        
//        // Link menus and allergens
//        linkMenusAndAllergens(menus: existingMenus, allergens: existingAllergens)
//        
//        // Save the context
//        try? context.save()
//    }
    
    private func initializeIngredientsIfNeeded(context: ModelContext) throws {
        let ingredientsFetch = FetchDescriptor<Ingredient>()
        let existingIngredients = try context.fetch(ingredientsFetch)
        
        if existingIngredients.isEmpty {
            let ingredients = Ingredient.sampleIngredients(with: Nutrient.sampleNutrients, context: context)
            ingredients.forEach { context.insert($0) }
            try context.save()
            print("Ingredients and nutrients initialized")
        }
    }
    
    private func initializeBabyIfNeeded(context: ModelContext) throws {
        let babyFetch = FetchDescriptor<Baby>()
        let existingBabies = try context.fetch(babyFetch)
        
        if existingBabies.isEmpty {
            generateBabyData(context: context)
            try context.save()
            print("Baby data initialized")
        }
    }
    
    private func initializeMotivationIfNeeded(context: ModelContext) throws {
        let motivationFetch = FetchDescriptor<Motivation>()
        let existingMotivations = try context.fetch(motivationFetch)
        
        if existingMotivations.isEmpty {
            generateMotivationData(context: context)
            try context.save()
            print("Motivation data initialized")
        }
    }
    
    private func initializeArticleIfNeeded(context: ModelContext) throws {
        let articleFetch = FetchDescriptor<Article>()
        let existingArticles = try context.fetch(articleFetch)
        
        if existingArticles.isEmpty {
            let articles = Article.sampleArticle
            articles.forEach { context.insert($0) }
            try context.save()
            print("Article data initialized")
        }
    }
    
    private func initializeAllergenIfNeeded(context: ModelContext) throws {
        let allergenFetch = FetchDescriptor<Allergen>()
        let existingAllergens = try context.fetch(allergenFetch)
        
        if existingAllergens.isEmpty {
//            generateallergenData(context: context)
//            try context.save()
//            print("Allergen data initialized")
            let allergens = Allergen.sampleAllergens
            //(with: nutrients)
            
            allergens.forEach { context.insert($0) }
//            nutrients.forEach { context.insert($0) }
            try context.save()
            print("allergens initialized")
        }
    }

//    private func generateNutrientData() -> [Nutrient] {
//        return [
//            Nutrient(name: "Protein", amount: 20, unit: "g"),
//            Nutrient(name: "Carbohydrates", amount: 30, unit: "g"),
//            Nutrient(name: "Fat", amount: 10, unit: "g"),
//            Nutrient(name: "Fiber", amount: 5, unit: "g"),
//            Nutrient(name: "Iron", amount: 8, unit: "mg"),
//            Nutrient(name: "Calcium", amount: 200, unit: "mg"),
//            Nutrient(name: "Vitamin C", amount: 60, unit: "mg"),
//            Nutrient(name: "Vitamin D", amount: 10, unit: "mcg")
//        ]
//    }
        
//    private func generateFoodMenuData() -> [FoodMenu] {
//        return [
//            FoodMenu(
//                name: "Breakfast",
//                description: "Morning meals suitable for babies",
//                image: "breakfast_icon",
//                isSelected: true
//            ),
//            FoodMenu(
//                name: "Lunch",
//                description: "Midday meals for growing babies",
//                image: "lunch_icon",
//                isSelected: true
//            ),
//            FoodMenu(
//                name: "Dinner",
//                description: "Evening meals for babies",
//                image: "dinner_icon",
//                isSelected: true
//            ),
//            FoodMenu(
//                name: "Snacks",
//                description: "Healthy snacks between meals",
//                image: "snack_icon",
//                isSelected: true
//            )
//        ]
//    }
    
    private func generateBabyData(context: ModelContext) {
//        let baby = Baby(babyProfileImage: "✨", babyName: "Eve", babyBirthDate: Date())
//        context.insert(baby)
    }
    
    private func generateArticleData(context: ModelContext) {
        let article1 = Article(
            previewArticle: "article1Image",
            articleTitle: "Introduce new food with food chaining",
            articleImage: "article1Image",
            articleSubheader: ["What is Food Chaining?", "Tips For Success 1", "Tips For Success 2"],
            articleDesc: ["Food chaining is a method that starts with feeding a food a child likes, then using small changes to work toward a new food.","""

            Tips For Success:
            - Have fun and make it a game. Encourage your child to take \"mouse bites,\" \"alligator bites,\" or touch the food with their tongue.
            - Focus on small steps & try one new item at a time. Keep trying!
            - Many children have to try a food more than 10 times before they start to like it.
            """,
            """
            Additional Tips:
            - Minimize distractions while your child is eating. (For example, turn off screens, put pets in another room, etc.)
            - Don't pressure your child; let them decide when they want to stop.
            - Plan meals & snacks ahead of time. Let your child know when to expect a meal or snack.
            """]
        )
        
        let article2 = Article(
            previewArticle: "article2Image",
            articleTitle: "How Long Does Food Chaining Take?",
            articleImage: "article2Image",
            articleSubheader: ["Food chaining doesn’t happen overnight"],
            articleDesc: ["Working on a food chain with your child may take weeks or even months. Remember, it can take 20 or more exposures of a new food before a child may begin to accept it. To put this into perspective – if you have 4 food “links” in your food chain, it might take 4 months to get to then end of your chain – or more! So while we may wish it with all our might, don’t expect a child to go through an entire food chain in a week."]
        )
        
        let article3 = Article(
            previewArticle: "article3Image",
            articleTitle: "How to Implement Food Chainning",
            articleImage: "article3Image",
            articleSubheader: ["1.Make a list of every food your child will eat.","2.Break food down by its sensory profile :", "3.Write food ideas with similar qualities"],
            articleDesc: ["First you need to know what foods your child already accepts. Take some time to think about foods you know they like and will eat. If your child is able to talk, chat with them to see what they like about the foods they do eat. See if there are any common patterns among these foods.", """
                - Color (tan, white, yellow, green, red, etc.). 
                - Texture (crunchy, soft, hard, sticky, squishy, etc.).
                - Temperature (warm, cold, room temp, etc.). 
                - Shape (oval, stick, circle, etc.).
                """, "Think of foods similar in taste, texture, smell, temperature, or color to those your child prefers. If they have more than one similarity, even better. Try not to limit yourself here. Write down as many ideas as you can think of – including foods you think your child would never eat."]
        )
        
        [article1, article2, article3].forEach {context.insert($0)}
        print("generated all article")
        
    }
    
    private func generateMotivationData(context: ModelContext) {
        let motivation1 = Motivation(
            previewMotivation: "home_motivation1",
            imageStory1: "motivation1image1",
            imageStory2: "motivation1image2",
            imageTrue: "motivation1image3_true",
            imageFalse: "motivation1image3_false",
            buttonText1: "Get Mad",
            buttonText2: "Encourage the kid",
            quotes: "Guiding Principle in Complementary Feeding: Gradually increase food consistency and variety",
            quotesSource: "World Health Organization",
            adviceImage: ["advice1_motivation1", "advice2_motivation1", "advice3_motivation1"],
            adviceText: ["Give baby more time and offer the meal again later","You still can offer her to eat maximum until 30 minute","Lack of sleep affects a child's appetite"]
        )
        let motivation2 = Motivation(
            previewMotivation: "home_motivation2",
            imageStory1: "motivation2image1",
            imageStory2: "motivation2image2",
            imageTrue: "motivation2image3_true",
            imageFalse: "motivation2image3_false",
            buttonText1: "Hide the carrot under rice",
            buttonText2: "Prepare a different carrot-based dish",
            quotes: "Non-responsive feeding behaviors, such as imposing too many rules, offering rewards, or forcing a child to eat, can lead to overeating and hinder their ability to control portion sizes.",
            quotesSource: "Nutri and Beyond Consultant",
            adviceImage: ["advice1_motivation2", "advice2_motivation2", "advice3_motivation2"],
            adviceText: ["Don’t assume your child doesn’t like something after only trying it once.","Introduce it 15-20 times with different preparations.","Maintain your child’s trust by being honest about the food you’re serving."]
            
        )
        
        let motivation3 = Motivation(
            previewMotivation: "home_motivation3",
            imageStory1: "motivation3image1",
            imageStory2: "motivation3image2",
            imageTrue: "motivation3image3_true",
            imageFalse: "motivation3image3_false",
            buttonText1: "Turn on her/his favourite movie",
            buttonText2: "offer them a choice to involve in the meal",
            quotes: "Social interactions between caregiver and child (such as speaking to the child, singing, and encouraging him/her) also stimulate connections in the child’s brain and promote cognitive development!",
            quotesSource: "World Health Organization",
            adviceImage: ["advice1_motivation3", "advice2_motivation3", "advice3_motivation3"],
            adviceText: ["Seat your child at the dining table in a calm environment, allowing them to focus on their meal.","Have the mother or other family members eat together with the baby.","Engage with your child by talking and interacting, such as telling them about the food during eat."]
            
        
        )
        
        [motivation1, motivation2, motivation3].forEach { context.insert($0) }
        print("generated all motivation")
    }
    
    private func generateallergenData(context: ModelContext) {
        let eggAllergen = Allergen(name: "Egg", image: "i_authentication_egg", isAllergy: false)
        let dairyAllergen = Allergen(name: "Dairy", image: "i_authentication_dairy", isAllergy: false)
        let fishAllergen = Allergen(name: "Fish", image: "i_authentication_fish", isAllergy: false)
        let glutenAllergen = Allergen(name: "Gluten", image: "i_authentication_gluten",isAllergy: false)
        let nonhalalAllergen =  Allergen(name: "Non-halal", image: "i_authentication_nonhalal", isAllergy: false)
        let soyAllergen = Allergen(name: "Soy", image: "i_authentication_soy", isAllergy: false)
        let treenutAllergen = Allergen(name: "Treenut", image: "i_authentication_treenut", isAllergy: false)
        let shellfishAllergen = Allergen(name: "Shellfish", image: "i_authentication_shellfish", isAllergy: false)
        let peanutAllergen = Allergen(name: "Peanut", image: "i_authentication_peanut", isAllergy: false)
        
        [eggAllergen, dairyAllergen, fishAllergen, glutenAllergen, nonhalalAllergen, soyAllergen, treenutAllergen, shellfishAllergen, peanutAllergen].forEach { context.insert($0) }
        print("generated all")
    }
    
    
    
}
