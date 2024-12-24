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
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            

            Tab("Meal Planner", systemImage: "fork.knife") {
                MealPlannerView()
            }


            Tab("Progress", systemImage: "chart.line.text.clipboard.fill") {
                ProgressView()
            }
         
            Tab("Profile", systemImage: "person.crop.circle.fill") {
                //view
            }
        }
    }
}

#Preview {
    TabBarView()
}
