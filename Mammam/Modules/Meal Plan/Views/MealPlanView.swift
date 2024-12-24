//
//  MealPlanView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var navigateToRateMeal = false // State to trigger navigation

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("this is meal plan view")
                        .kerning(0.2)

//                    Button {
//                        navigateToRateMeal = true
//                                    coordinator.presentSheet(sheet: .rateMeal)
//                    } label: {
//                        Text("forgot password")
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .navigationDestination(isPresented: $navigateToRateMeal) {
//                        RateMealView() // This will show RateMealView within the same sheet
//                    }

                    Text("Ingredients")
                    VStack(alignment: .leading) {
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                        Text("A List Item")
                        Text("A Second List Item")
                        Text("A Third List Item")
                    }
                }
            }
        }
    }
}

#Preview {
    MealPlanView()
}
