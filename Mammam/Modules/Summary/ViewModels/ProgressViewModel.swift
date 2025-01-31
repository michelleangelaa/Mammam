////
////  ProgressViewModel.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 31/01/25.
////
//
//import SwiftUI
//import SwiftData
//
//class ProgressViewModel: ObservableObject {
//    @Published var meals: [Meal] = []
//    @Published var nutrients: [Nutrient] = []
//    @Published var period: Int = 0 // 0: Monthly, 1: Weekly
//    @Published var currentDate = Date()
//
//    func fetchData(context: ModelContext) {
//        do {
//            let mealDescriptor = FetchDescriptor<Meal>()
//            let nutrientDescriptor = FetchDescriptor<Nutrient>()
//            DispatchQueue.main.async {
//                self.meals = (try? context.fetch(mealDescriptor)) ?? []
//                self.nutrients = (try? context.fetch(nutrientDescriptor)) ?? []
//            }
//        } catch {
//            print("Error fetching data: \(error)")
//        }
//    }
//
//    var filteredMeals: [Meal] {
//        let calendar = Calendar.current
//        let range = period == 0 ? calendar.dateInterval(of: .month, for: currentDate) : calendar.dateInterval(of: .weekOfYear, for: currentDate)
//
//        return meals.filter {
//            $0.isLogged &&
//            ($0.timeGiven >= (range?.start ?? Date()) && $0.timeGiven <= (range?.end ?? Date()))
//        }
//    }
//
//    var filteredNutrients: [Nutrient] {
//        var nutrientCounts = [String: Int]()
//        for meal in filteredMeals {
//            meal.ingredient?.nutrients?.forEach { nutrient in
//                nutrientCounts[nutrient.name, default: 0] += 1
//            }
//        }
//        return nutrientCounts.map { Nutrient(name: $0.key, nutrientCount: $0.value) }
//    }
//
//    func navigateDate(_ step: Int) {
//        let calendar = Calendar.current
//        let unit: Calendar.Component = (period == 0) ? .month : .weekOfYear
//        currentDate = calendar.date(byAdding: unit, value: step, to: currentDate) ?? currentDate
//    }
//
//    var displayPeriodTitle: String {
//        let calendar = Calendar.current
//        if period == 0 {
//            return displayMonths()
//        } else {
//            return displayWeeks()
//        }
//    }
//
//    private func displayMonths() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM"
//        return formatter.string(from: currentDate)
//    }
//
//    private func displayWeeks() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM"
//        let startOfWeek = Calendar.current.startOfWeek(for: currentDate)
//        let weekOfYear = Calendar.current.component(.weekOfYear, from: startOfWeek)
//        return "\(formatter.string(from: startOfWeek)), Week \(weekOfYear)"
//    }
//}
