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
            ZStack {
                Image("BG_SplashScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 200, height: 86)
                            .padding(.bottom, 32)
                        Text("Generating meal...")
                    }
                }
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
