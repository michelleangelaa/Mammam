//
//  SelectDateView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 19/12/24.
//

import SwiftData
import SwiftUI

struct SelectDateView: View {
    @Environment(\.modelContext) private var context
    @State private var startDate: Date = .init()
    @State private var endDate: Date = .init()
//    @State private var navigateToGenerateMealLoadingView = false
    @State private var navigateToReviewMealType = false
    @State private var createdMealPlan: MealPlan?

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            indicatorbar(totalCount: 5, currentIndex: 1)

            VStack(alignment: .leading) {
                Text("Select Date")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Create your weekly meal plan for Eve 🤩")
                    .font(.footnote)
            }
            .padding(.horizontal)

            HStack {
                VStack(spacing: 4) {
                    Text(dayString(from: startDate))
                        .font(.headline)
                    DatePicker("", selection: $startDate, displayedComponents: .date)
                        .labelsHidden()
                        .fixedSize()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()

                Text("to")

                VStack(spacing: 4) {
                    Text(dayString(from: endDate))
                        .font(.headline)
                    DatePicker("", selection: $endDate, displayedComponents: .date)
                        .labelsHidden()
                        .fixedSize()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }

            Spacer()

//            NavigationLink(
//                destination: GenerateMealLoadingView(),
//                isActive: $navigateToGenerateMealLoadingView
//            ) {
//                EmptyView()
//            }
            NavigationLink(
                destination: ReviewMealTypeView(mealPlan: createdMealPlan ?? MealPlan(startDate: startDate, endDate: endDate)),
                isActive: $navigateToReviewMealType
            ) {
                EmptyView()
            }

            CustomLargeButtonComponent(state: .enabled, text: "Next") {
                print("pressed button")
                guard createdMealPlan == nil else { return } // Prevent duplicate creation

                createMealPlan()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
        }
    }

    private func createMealPlan() {
        print("Creating Meal Plan")

        let newMealPlan = MealPlan(startDate: startDate, endDate: endDate)
        context.insert(newMealPlan)

        // Generate meals for the meal plan
        generateMeals(for: newMealPlan)

        // Save the meal plan and update state
        do {
            try context.save()
            print("saved")
        } catch {
            print("Failed to save context: \(error)")
        }

        createdMealPlan = newMealPlan
        navigateToReviewMealType = true
    }

    private func generateMeals(for mealPlan: MealPlan) {
        let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
        let calendar = Calendar.current
        let totalDays = calendar.dateComponents([.day], from: mealPlan.startDate, to: mealPlan.endDate).day ?? 0

        for dayOffset in 0 ... totalDays {
            guard let currentDate = calendar.date(byAdding: .day, value: dayOffset, to: mealPlan.startDate) else { continue }

            for mealType in mealTypes {
                let timeGiven = currentDate
                let timeEnded = calendar.date(byAdding: .hour, value: 1, to: timeGiven) ?? timeGiven
                let ingredient = Ingredient.sampleIngredients.randomElement()!

                let meal = Meal(
                    ingredient: ingredient,
                    mealPlan: mealPlan,
                    type: mealType,
                    timeGiven: timeGiven,
                    timeEnded: timeEnded,
                    servingUnit: "Cup",
                    servingQty: 100,
                    consumedQty: 0,
                    isAllergic: false,
                    isLogged: false,
                    notes: ""
                )
                print("Created Meal: \(meal.type) for MealPlan with start date: \(mealPlan.startDate)")

                context.insert(meal) // Add the meal to the context

                // Explicitly add meal to mealPlan's meals array
                if mealPlan.meals == nil {
                    mealPlan.meals = []
                }
                mealPlan.meals?.append(meal)
            }
        }
    }
}

private func dateString(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd"
    return formatter.string(from: date)
}

private func dayString(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: date)
}

#Preview {
    SelectDateView()
}
