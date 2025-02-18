//
//  SelectDateViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 30/01/25.
//

// SelectDateViewModel.swift

import Foundation
import SwiftData

class SelectDateViewModel: ObservableObject {
    @Published var startDate: Date = .init()
    @Published var endDate: Date = .init()
    @Published var createdMealPlan: MealPlan?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""

    func setupDefaultDates(context: ModelContext) {
        let fetchDescriptor = FetchDescriptor<MealPlan>(sortBy: [SortDescriptor(\.endDate, order: .reverse)])
        if let lastMealPlan = try? context.fetch(fetchDescriptor).first {
            startDate = Calendar.current.date(byAdding: .day, value: 1, to: lastMealPlan.endDate) ?? .init()
        } else {
            startDate = Calendar.current.startOfDay(for: Date())
        }
        endDate = Calendar.current.date(byAdding: .day, value: 6, to: startDate) ?? .init()
    }

    func validateDates(context: ModelContext) -> Bool {
        if startDate > endDate {
            alertMessage = "The start date cannot be later than the end date. Please adjust the dates."
            return false
        }

        let fetchDescriptor = FetchDescriptor<MealPlan>()
        let existingMealPlans = (try? context.fetch(fetchDescriptor)) ?? []

        for plan in existingMealPlans {
            if datesOverlap(start1: startDate, end1: endDate, start2: plan.startDate, end2: plan.endDate) {
                alertMessage = "Selected dates overlap with an existing meal plan. Please choose a start date after \(dateString(from: plan.endDate))."
                return false
            }
        }
        return true
    }

    private func datesOverlap(start1: Date, end1: Date, start2: Date, end2: Date) -> Bool {
        return !(end1 < start2 || start1 > end2)
    }

    func createMealPlan(context: ModelContext) {
        let fetchRequest = FetchDescriptor<User>()
        guard let currentUser = try? context.fetch(fetchRequest).first,
              let baby = currentUser.baby
        else {
            alertMessage = "No user or baby found. Please set up your profile first."
            showAlert = true
            return
        }

        let newMealPlan = MealPlan(startDate: startDate, endDate: endDate, baby: baby)
        context.insert(newMealPlan)

        if baby.mealPlans == nil {
            baby.mealPlans = []
        }
        baby.mealPlans?.append(newMealPlan)

        generateMeals(context: context, for: newMealPlan)

        do {
            try context.save()
        } catch {
            alertMessage = "Failed to save meal plan. Please try again."
            showAlert = true
            print("Failed to save context: \(error)")
        }

        createdMealPlan = newMealPlan
    }

    private func generateMeals(context: ModelContext, for mealPlan: MealPlan) {
        // Fetch only safe ingredients (without allergens that are `isAllergy == true`)
        let safeIngredients = Ingredient.fetchSafeIngredients(context: context)

        guard !safeIngredients.isEmpty else {
            alertMessage = "No safe ingredients available. Please add more ingredients."
            showAlert = true
            return
        }
        print("Safe Ingredients Available: \(safeIngredients.map { $0.name })")


        let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
        let calendar = Calendar.current

        let numberOfDays = calendar.dateComponents([.day], from: calendar.startOfDay(for: mealPlan.startDate),
                                                   to: calendar.startOfDay(for: mealPlan.endDate)).day ?? 0
        let totalDays = numberOfDays + 1

        if mealPlan.meals == nil {
            mealPlan.meals = []
        }

        for dayOffset in 0 ..< totalDays {
            guard let currentDate = calendar.date(bySettingHour: 12, minute: 0, second: 0, of:
                calendar.date(byAdding: .day, value: dayOffset, to: calendar.startOfDay(for: mealPlan.startDate))!)
            else {
                continue
            }

            for mealType in mealTypes {
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
                      let timeEnded = calendar.date(byAdding: .hour, value: 1, to: mealTime)
                else {
                    continue
                }

                // Select a random ingredient **only from safe ingredients**
                let randomIngredient = safeIngredients.randomElement()!

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

                context.insert(meal)
                mealPlan.meals?.append(meal)
            }
        }
    }

    func dayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }

    func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: date)
    }
}
