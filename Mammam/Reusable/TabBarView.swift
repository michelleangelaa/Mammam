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
                //view
            }
            

            Tab("Meal Planner", systemImage: "fork.knife") {
                //view
            }


            Tab("Progress", systemImage: "chart.line.text.clipboard.fill") {
                //view
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
