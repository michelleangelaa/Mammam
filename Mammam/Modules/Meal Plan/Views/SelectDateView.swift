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
        let ingredientsFetchDescriptor = FetchDescriptor<Ingredient>()
        let existingIngredients: [Ingredient]
        do {
            existingIngredients = try context.fetch(ingredientsFetchDescriptor)
        } catch {
            print("Failed to fetch ingredients: \(error)")
            return
        }
            
        guard !existingIngredients.isEmpty else {
            print("No existing ingredients found in database")
            return
        }
        
        let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
        let calendar = Calendar.current
        
        // Calculate days including both start and end date
        let numberOfDays = calendar.dateComponents([.day], from: calendar.startOfDay(for: mealPlan.startDate),
                                                 to: calendar.startOfDay(for: mealPlan.endDate)).day ?? 0
        let totalDays = numberOfDays + 1
        
        print("Generating meals for \(totalDays) days from \(mealPlan.startDate) to \(mealPlan.endDate)")
        
        // Initialize meals array if needed
        if mealPlan.meals == nil {
            mealPlan.meals = []
        }
        
        for dayOffset in 0..<totalDays {
            // Use noon time to avoid any timezone issues
            guard let currentDate = calendar.date(bySettingHour: 12, minute: 0, second: 0, of:
                calendar.date(byAdding: .day, value: dayOffset, to: calendar.startOfDay(for: mealPlan.startDate))!) else {
                continue
            }
            
            print("Generating meals for date: \(currentDate)")
            
            for mealType in mealTypes {
                // Set specific times for each meal type
                let mealHour: Int
                switch mealType {
                case "Breakfast": mealHour = 8
                case "Morning Snack": mealHour = 10
                case "Lunch": mealHour = 12
                case "Evening Snack": mealHour = 15
                case "Dinner": mealHour = 18
                default: mealHour = 12
                }
                
                guard let mealTime = calendar.date(bySettingHour: mealHour, minute: 0, second: 0, of: currentDate),
                      let timeEnded = calendar.date(byAdding: .hour, value: 1, to: mealTime) else {
                    continue
                }
                
                let randomIngredient = existingIngredients.randomElement()!
                
                let meal = Meal(
                    ingredient: randomIngredient,
                    mealPlan: mealPlan,
                    type: mealType,
                    timeGiven: mealTime,
                    timeEnded: timeEnded,
                    servingUnit: "Cup",
                    servingQty: 3,
                    consumedQty: 0,
                    isAllergic: false,
                    isLogged: false,
                    notes: ""
                )
                
                print("Created \(mealType) for date: \(mealTime)")
                
                context.insert(meal)
                mealPlan.meals?.append(meal)
            }
        }
        
        print("Total meals generated: \(mealPlan.meals?.count ?? 0)")
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
