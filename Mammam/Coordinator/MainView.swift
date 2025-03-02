//
//  MainView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 24/12/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.home)
            MealPlannerView()
                .tabItem {
                    Label("Meal Planner", systemImage: "fork.knife")
                }
                .tag(Tab.mealPlanner)
            ProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.line.text.clipboard.fill")
                }
                .tag(Tab.progress)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
                .tag(Tab.profile)
        }
        .onAppear {
            if coordinator.selectedTab != nil {
                selectedTab = coordinator.selectedTab!
                coordinator.selectedTab = nil // Reset after navigation
            }
        }
        .navigationBarBackButtonHidden(true)
      
    }

    enum Tab: Hashable {
        case home
        case mealPlanner
        case progress
        case profile
    }
}

#Preview {
    MainView()
}
