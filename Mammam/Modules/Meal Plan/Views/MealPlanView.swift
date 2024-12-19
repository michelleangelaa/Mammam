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
            VStack {
                Text("this is meal plan view")
                    .kerning(0.2)

                Button {
                    navigateToRateMeal = true
                    coordinator.presentSheet(sheet: .rateMeal)
                } label: {
                    Text("forgot password")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

func generateWeeklyMealPlan(for mealPlan: MealPlan, with ingredients: [Ingredient]) {
    let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
    let calendar = Calendar.current

    guard let numberOfDays = calendar.dateComponents([.day], from: mealPlan.startDate, to: mealPlan.endDate).day else {
            print("Invalid date range.")
            return
        }
    
    var meals: [Meal] = []
    
    for dayOffset in 0...numberOfDays {
        guard let currentDate = calendar.date(byAdding: .day, value: dayOffset, to: mealPlan.startDate) else {
            continue
        }
        
        for mealType in mealTypes {
            let timeGiven = currentDate
            let timeEnded = calendar.date(byAdding: .hour, value: 1, to: timeGiven) ?? timeGiven
            
            let ingredient = ingredients.randomElement()!
            
            let meal = Meal(
                ingredient: ingredient,
                type: mealType,
                timeGiven: timeGiven,
                timeEnded: timeEnded,
                servingUnit: "cup",
                servingQty: 100,
                consumedQty: 0,
                isAllergic: false,
                isLogged: false,
                notes: ""
            )
        }
    }
    
}

#Preview {
    MealPlanView()
}
