//
//  MammamApp.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 01/10/24.
//

import SwiftUI
import SwiftData

@main
struct MammamApp: App {
    let container: ModelContainer
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
//            SavedMenuView()
        

        }
        .modelContainer(container)
//        .modelContainer(for: [Meal.self])
    }
    
    init() {
//        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        let schema = Schema([Meal.self])
        let config = ModelConfiguration("MammamData", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
        
        print(URL.documentsDirectory.path())
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
//    {        
//        return true
//    }
//}
