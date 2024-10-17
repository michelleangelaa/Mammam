//
//  MealPlanView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var navigateToRateMeal = false  // State to trigger navigation

    
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("this is meal plan view")
                    .kerning(0.2)
            }
            Button {
                navigateToRateMeal = true
    //            coordinator.presentSheet(sheet: .rateMeal)
            } label: {
                Text("forgot password")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $navigateToRateMeal) {
                            RateMealView()  // This will show RateMealView within the same sheet
                        }
        }
        
    }
}

#Preview {
    MealPlanView()
}
