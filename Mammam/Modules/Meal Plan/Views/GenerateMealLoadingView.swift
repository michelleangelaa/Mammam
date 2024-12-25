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
            .onAppear {
                // Redirect after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    coordinator.push(page: .mealPlan) // Navigate to MealPlannerView using Coordinator
                }
            }
        }
    }
}

#Preview {
    GenerateMealLoadingView()
}
