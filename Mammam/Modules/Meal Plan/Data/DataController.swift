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
    
//    private func generateArticleData(context: ModelContext) {
//        let article = Article(
//            articleTitle: "Introduce new food with food chaining",
//            articleImage: "motivationimage1",
//            articleSubheader: "What is Food Chaining?",
//            articleDesc: """
//            Food chaining is a method that starts with feeding a food a child likes, then using small changes to work toward a new food.
//
//            Tips For Success:
//            - Have fun and make it a game. Encourage your child to take \"mouse bites,\" \"alligator bites,\" or touch the food with their tongue.
//            - Focus on small steps & try one new item at a time. Keep trying!
//            - Many children have to try a food more than 10 times before they start to like it.
//
//            Additional Tips:
//            - Minimize distractions while your child is eating. (For example, turn off screens, put pets in another room, etc.)
//            - Don't pressure your child; let them decide when they want to stop.
//            - Plan meals & snacks ahead of time. Let your child know when to expect a meal or snack.
//            """
//        )
//        context.insert(article)
//    }
    
    private func generateMotivationData(context: ModelContext) {
        let motivation = Motivation(
            imageStory1: "motivationimage1",
            imageStory2: "motivationimage2",
            imageTrue: "motivationimage3_true",
            imageFalse: "motivationimage3_false",
            quotes: "It's okay if your child rejects food today, keep offering it in different forms. Consistency is key!",
            tips: """
            - Give baby more time and offer the meal again later.
            - You still can offer her to eat for a maximum of 30 minutes.
            """
        )
        context.insert(motivation)
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
