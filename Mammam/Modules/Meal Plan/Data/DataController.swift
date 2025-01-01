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
            try initializeIngredientsIfNeeded(context: context)
            try initializeBabyIfNeeded(context: context)
            try initializeMotivationIfNeeded(context: context)
            try initializeArticleIfNeeded(context: context)
            try initializeAllergenIfNeeded(context: context)
            
        } catch {
            print("Failed to initialize data: \(error)")
        }
    }
    
    private func initializeIngredientsIfNeeded(context: ModelContext) throws {
        let ingredientsFetch = FetchDescriptor<Ingredient>()
        let existingIngredients = try context.fetch(ingredientsFetch)
        
        if existingIngredients.isEmpty {
            let nutrients = Nutrient.sampleNutrients
            let ingredients = Ingredient.sampleIngredients(with: nutrients)
            
            nutrients.forEach { context.insert($0) }
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
            generateArticleData(context: context)
            try context.save()
            print("Article data initialized")
        }
    }
    
    private func initializeAllergenIfNeeded(context: ModelContext) throws {
        let allergenFetch = FetchDescriptor<Allergen>()
        let existingAllergens = try context.fetch(allergenFetch)
        
        if existingAllergens.isEmpty {
            generateallergenData(context: context)
            try context.save()
            print("Allergen data initialized")
        }
    }
    
    private func generateBabyData(context: ModelContext) {
        let baby = Baby(babyProfileImage: "i_profile_person", babyName: "Eve", babyBirthDate: Date())
        context.insert(baby)
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
        let eggAllergen = Allergen(name: "Egg", image: "i_authentication_egg")
        let dairyAllergen = Allergen(name: "Dairy", image: "i_authentication_dairy")
        
        [eggAllergen, dairyAllergen].forEach { context.insert($0) }
    }
}
