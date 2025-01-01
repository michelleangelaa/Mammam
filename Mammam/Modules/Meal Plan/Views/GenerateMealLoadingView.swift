//
//  GenerateMealLoadingView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 19/12/24.
//

import SwiftUI

struct GenerateMealLoadingView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var navigateToMealPlanner = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Image(systemName: "book.and.wrench.fill")
                    .font(.system(size: 40))
                Text("Generating Meal")
                    .font(.title3)
            }
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    coordinator.dismissCover() // Dismiss the full-screen loading view
//                    coordinator.push(page: .mealPlan) // Navigate to MealPlannerView
//                }
//            }
        
        }
    }
}

#Preview {
    GenerateMealLoadingView()
}
