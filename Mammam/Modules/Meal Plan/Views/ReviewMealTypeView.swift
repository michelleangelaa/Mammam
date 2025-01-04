//
//  ReviewMealTypeView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 19/12/24.
//

import SwiftData
import SwiftUI

struct ReviewMealTypeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @State private var currentMealTypeIndex: Int = 0
    @State private var meals: [Meal] = []
    @State private var isLastMealType: Bool = false

    var mealPlan: MealPlan

    // Meal types to review
    private let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
    private var defaultIngredients: [String: Ingredient] {
        generateDefaultIngredients()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Progress Indicator
            indicatorbar(totalCount: mealTypes.count, currentIndex: currentMealTypeIndex + 1)

            // Header
            VStack(alignment: .leading, spacing: 4) {
                Text("Review \(mealTypes[currentMealTypeIndex])")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Healthy \(mealTypes[currentMealTypeIndex].lowercased()) with nutrition")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Meal Cards
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(meals.sorted(by: { $0.timeGiven < $1.timeGiven }), id: \.self) { meal in
                        ReviewMealCardView(meal: meal, dayRange: formattedDate(meal.timeGiven)) { updatedIngredient in
                            updateMealIngredient(meal, newIngredient: updatedIngredient)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()

            // Navigation Button
            CustomLargeButtonComponent(state: .enabled, text: isLastMealType ? "Save" : "Next") {
                if currentMealTypeIndex < mealTypes.count - 1 {
                    currentMealTypeIndex += 1
                } else {
                    isLastMealType = true
                    coordinator.presentFullScreenCover(fullScreenCover: .loadingView) // Present GenerateMealLoadingView
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        coordinator.dismissCover()
                        coordinator.selectedTab = .mealPlanner
                        coordinator.push(page: .main) // Navigate to MealPlannerView after loading
                    }
                }
            }

            .padding(.horizontal)
        }
        .onAppear {
            print("OnAppear - Initial MealPlan meals count: \(mealPlan.meals?.count ?? 0)")
            // Add a slight delay to ensure meals are loaded
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                loadMealsForCurrentMealType()
            }
        }
        .onChange(of: currentMealTypeIndex) { _ in
            loadMealsForCurrentMealType()
        }
    }

//    private func groupMealsByDay(startDate: Date, endDate: Date, meals: [Meal]) -> [(key: String, value: [Meal])] {
//        let calendar = Calendar.current
//        let totalDays = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
//        let dayRanges = [3, 2, 2] // Day grouping pattern
//        var groupedMeals: [(key: String, value: [Meal])] = []
//        var currentStartDate = startDate
//
//        for range in dayRanges {
//            guard let rangeEndDate = calendar.date(byAdding: .day, value: range, to: currentStartDate) else { break }
//            let rangeMeals = meals.filter { meal in
//                calendar.isDate(meal.timeGiven, inSameDayAs: currentStartDate) ||
//                    (meal.timeGiven >= currentStartDate && meal.timeGiven <= rangeEndDate)
//            }
//
//            let rangeKey = "\(formattedDate(currentStartDate)) - \(formattedDate(rangeEndDate))"
//            groupedMeals.append((key: rangeKey, value: rangeMeals))
//
//            // Move start date to the next range
//            guard let nextStartDate = calendar.date(byAdding: .day, value: range, to: currentStartDate) else { break }
//            currentStartDate = nextStartDate
//        }
//
//        return groupedMeals
//    }

    private func generateDefaultIngredients() -> [String: Ingredient] {
        let dayRanges = ["Sun-Tue", "Wed-Thu", "Fri-Sat"]
        let randomIngredients = Ingredient.sampleIngredients.shuffled()

        return Dictionary(uniqueKeysWithValues: zip(dayRanges, randomIngredients.prefix(dayRanges.count)))
    }

    private func loadMealsForCurrentMealType() {
        let currentMealType = mealTypes[currentMealTypeIndex]

        // Ensure we have the latest meals from the meal plan
        if let mealPlanMeals = mealPlan.meals {
            // Filter meals for current type and sort by date
            meals = mealPlanMeals
                .filter { $0.type == currentMealType }
                .sorted { $0.timeGiven < $1.timeGiven }

            print("Loading meals for \(currentMealType)")
            print("Total meals in plan: \(mealPlanMeals.count)")
            print("Filtered meals for \(currentMealType): \(meals.count)")

            meals = mealPlanMeals
                .filter { meal in
                    let isSameType = meal.type == currentMealType
                    print("Checking meal: \(meal.type) at \(meal.timeGiven) - matches type: \(isSameType)")
                    return isSameType
                }
                .sorted { $0.timeGiven < $1.timeGiven }

            print("Filtered meals for \(currentMealType): \(meals.count)")
            for meal in meals {
                print("\(currentMealType) on \(formattedDate(meal.timeGiven))")
            }
        }
    }

    private func updateMealIngredient(_ meal: Meal, newIngredient: Ingredient) {
        meal.ingredient = newIngredient
        do {
            try context.save() // Save changes to the database
            print("Meal ingredient updated to \(newIngredient.name)")
        } catch {
            print("Failed to update meal ingredient: \(error)")
        }
    }

//    private func createDefaultMeals(for mealType: String) -> [Meal] {
//        defaultIngredients.map { _, ingredient in
//            let meal = Meal(
//                ingredient: ingredient,
//                mealPlan: mealPlan, // Associate the meal with the current MealPlan
//                type: mealType,
//                timeGiven: Date(),
//                timeEnded: Date().addingTimeInterval(3600),
//                servingUnit: "gram",
//                servingQty: 100,
//                consumedQty: 0,
//                isAllergic: false,
//                isLogged: false,
//                notes: ""
//            )
//            context.insert(meal)
//            return meal
//        }
//    }
}

struct ReviewMealCardView: View {
    var meal: Meal
    var dayRange: String
    var onReplace: (Ingredient) -> Void
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        HStack(spacing: 16) {
            Image(meal.ingredient?.image ?? "fork.knife") // Placeholder for the meal image
                .resizable()
                .frame(width: 70, height: 70)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(dayRange)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(UIColor.systemGray6))
                    )
                Text(meal.ingredient?.name ?? "Unknown")
                    .font(.headline)
                Text("\(meal.ingredient?.menus?.count ?? 0) menu(s)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(meal.type)
            }
            Spacer()

            // Replace Button
            Button(action: {
                if let currentIngredient = meal.ingredient {
                    // Filter out the current ingredient
                    let availableIngredients = Ingredient.getExistingIngredients(context: context)
                        .filter { $0.name != currentIngredient.name }

                    if let newIngredient = availableIngredients.randomElement() {
                        // Just update the reference, don't create new data
                        onReplace(newIngredient)
                    }
                }
            }) {
                Image(systemName: "arrow.clockwise")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray6))
        )
        .onTapGesture {
            coordinator.presentSwapIngredientsSheet(for: meal) // Trigger the half-sheet
        }
    }
}

enum ReviewMealPreviewData {
    static func sampleMealPlan(startDate: Date, endDate: Date) -> MealPlan {
        let mealPlan = MealPlan(startDate: startDate, endDate: endDate)

        // Add sample meals
        let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
        let calendar = Calendar.current

        let totalDays = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0

        for dayOffset in 0 ... totalDays {
            guard let currentDate = calendar.date(byAdding: .day, value: dayOffset, to: startDate) else { continue }

            for mealType in mealTypes {
                let timeGiven = currentDate
                let timeEnded = calendar.date(byAdding: .hour, value: 1, to: timeGiven) ?? timeGiven
                let ingredient = Ingredient(name: "Ingredient \(dayOffset)-\(mealType)")

                let meal = Meal(
                    ingredient: ingredient,
                    mealPlan: mealPlan,
                    type: mealType,
                    timeGiven: timeGiven,
                    timeEnded: timeEnded,
                    servingUnit: "gram",
                    servingQty: 100,
                    consumedQty: 0,
                    isAllergic: false,
                    isLogged: false,
                    notes: "Sample notes for \(mealType)"
                )
                mealPlan.meals?.append(meal) // Associate meals with the MealPlan
            }
        }

        return mealPlan
    }
}

private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd"
    return formatter.string(from: date)
}

#Preview {
    let startDate = Date()
    let endDate = Calendar.current.date(byAdding: .day, value: 6, to: startDate)!
    ReviewMealTypeView(mealPlan: ReviewMealPreviewData.sampleMealPlan(startDate: startDate, endDate: endDate))
}
