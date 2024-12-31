//
//  MainView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 24/12/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var coordinator: Coordinator

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
            RegisterFormView().tabItem({
                Label("Profile", systemImage: "person.crop.circle.fill")
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
        .environmentObject(Coordinator())

}
