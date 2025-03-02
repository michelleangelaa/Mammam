//
//  TabBarView.swift
//  Mammam
//
//  Created by Evelyn Santoso on 05/12/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView().tabItem({
                Label("Home", systemImage: "house.fill")
            })
            MealPlannerView().tabItem({
                Label("Meal Planner", systemImage: "fork.knife")
            })
            ProgressView().tabItem({
                Label("Progress", systemImage: "chart.line.text.clipboard.fill")
            })
            ProfileView().tabItem({
                Label("Profile", systemImage: "person.crop.circle.fill")
            })
        }
    }
}

#Preview {
    TabBarView()
}
