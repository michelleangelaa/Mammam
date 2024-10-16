//
//  MammamApp.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 01/10/24.
//

import Firebase
import SwiftUI

@main
struct MammamApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        FirebaseApp.configure()
        
        return true
    }
}
