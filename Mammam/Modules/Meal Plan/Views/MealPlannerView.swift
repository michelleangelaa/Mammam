//
//  MealPlannerView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftData
import SwiftUI

struct MealPlannerView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var navigateToRateMeal = false // State to trigger navigation
    @State var mealPlan: MealPlan

    var groupedMeals: [String: [Meal]] {
        Dictionary(grouping: mealPlan.meals ?? [], by: { meal in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, dd MMM"
            return dateFormatter.string(from: meal.timeGiven)

        })
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(groupedMeals.keys.sorted(), id: \.self) { date in
                        Section(header:
                            HStack {
                                Text(date)
                                    .font(.headline)
                                    .padding(.leading, 8)
                            }

                        ) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(groupedMeals[date] ?? [], id: \.self) { meal in
                                        MealCardView(meal: meal)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
            .padding(.top)
        }
    }
}

struct MealCardView: View {
    var meal: Meal
    var body: some View {
        VStack(spacing: 10) {
            if let ingredient = meal.ingredient {
                Image(systemName: "leaf")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .cornerRadius(8)
            } else {
                Color.gray
                    .frame(width: 70, height: 70)
                    .cornerRadius(8)
            }
            Text(meal.type)
                .font(.subheadline)
                .bold()

            Text(meal.ingredient?.name ?? "No ingredient")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(width: 120)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(GrayColor().gray25)
        )
    }
}

// Helper Data and Functions
enum MealPlanPreviewData {
    static let sampleIngredients = [
        Ingredient(name: "Egg"),
        Ingredient(name: "Berries"),
        Ingredient(name: "Potato"),
        Ingredient(name: "Tomato"),
        Ingredient(name: "Apple")
    ]

    static let sampleMealPlan: MealPlan = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let startDate = dateFormatter.date(from: "2024-12-19")!
        let endDate = dateFormatter.date(from: "2024-12-26")!
        let mealPlan = MealPlan(startDate: startDate, endDate: endDate)

        generateWeeklyMealPlan(for: mealPlan, with: sampleIngredients)
        return mealPlan
    }()
}

func generateWeeklyMealPlan(for mealPlan: MealPlan, with ingredients: [Ingredient]) {
    let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
    let calendar = Calendar.current

    guard let numberOfDays = calendar.dateComponents([.day], from: mealPlan.startDate, to: mealPlan.endDate).day else {
        print("Invalid date range.")
        return
    }

    var meals: [Meal] = []

    for dayOffset in 0 ... numberOfDays {
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
            meals.append(meal)
        }
    }
    mealPlan.meals = meals
}

#Preview {
    MealPlannerView(mealPlan: MealPlanPreviewData.sampleMealPlan)
}
