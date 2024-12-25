//
//  MammamApp.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 01/10/24.
//

import SwiftData
import SwiftUI

@main
struct MammamApp: App {
//    let container: ModelContainer
    let dataController = DataController.shared

    @Environment(\.modelContext) private var context

//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
//            HomeView()
            AccountView()
//            CoordinatorView()
//            SavedMenuView()
//            MealPlannerView()
//            ProgressView()
//            MealFeedbackView()
//            MealFeedbackView(meal: meal, fromRateMealView: false))
//            FoodMenuView()
//            MealDetailView(ingredient: myIngredients.first(where: { $0.name == "Egg" })!)
        }
        .modelContainer(dataController.container)
        
//        .modelContainer(for: [Meal.self])
    }

    init() {
//        print(URL.applicationSupportDirectory.path(percentEncoded: false))
//        let schema = Schema(
//            [
//                    Meal.self,
//                    MealPlan.self,
//                    Ingredient.self,
//                    Nutrient.self,
//                    FoodMenu.self,
//                    Allergen.self
//                ]
//        )
//        let config = ModelConfiguration("MammamData", schema: schema)
//        do {
//            container = try ModelContainer(for: schema, configurations: config)
//        } catch {
//            fatalError("Could not configure the container")
//        }
//        dataController.initializeDataIfNeeded()
        print(URL.documentsDirectory.path())

        dataController.initializeDataIfNeeded()


    }
}

// class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
//    {
//        return true
//    }
// }
