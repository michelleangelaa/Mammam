//
//  ProgressViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 31/01/25.

import Foundation
import SwiftData
import SwiftUI

class ProgressViewModel: ObservableObject {
    @Published var period = 0 // 0: Monthly, 1: Weekly
    @Published var currentDate = Date()
    
    var meals: [Meal] = []
    var nutrients: [Nutrient] = []
    
    // MARK: - Computed Properties
    
    var filteredMeals: [Meal] {
        let calendar = Calendar.current
        
        if period == 1 { // Weekly
            let weekRange = calendar.dateInterval(of: .weekOfYear, for: currentDate)
            return meals.filter {
                $0.isLogged &&
                ($0.timeGiven >= (weekRange?.start ?? Date()) &&
                $0.timeGiven <= (weekRange?.end ?? Date()))
            }
        } else { // Monthly
            let monthRange = calendar.dateInterval(of: .month, for: currentDate)
            return meals.filter {
                $0.isLogged &&
                ($0.timeGiven >= (monthRange?.start ?? Date()) &&
                $0.timeGiven <= (monthRange?.end ?? Date()))
            }
        }
    }
    
    var filteredNutrients: [Nutrient] {
        var nutrientCounts = [String: Int]()
        for meal in filteredMeals {
            meal.ingredient?.nutrients?.forEach { nutrient in
                nutrientCounts[nutrient.name, default: 0] += 1
            }
        }
        return nutrientCounts.map { Nutrient(name: $0.key, nutrientCount: $0.value) }
    }
    
    var displayPeriodTitle: String {
        period == 0 ? displayMonths() : displayWeeks()
    }
    
    var totalLoggedMealsCount: Int {
        filteredMeals.count
    }
    
    var percentageChange: Double {
        let previousCount = totalLoggedMealsCount(for: -1)
        let currentCount = totalLoggedMealsCount
        guard previousCount > 0 else { return 0 }
        return Double(currentCount - previousCount) / Double(previousCount) * 100
    }
    
    var percentageChangeText: String {
        if percentageChange > 0 {
            return "+\(String(format: "%.1f", percentageChange))% from last \(period == 0 ? "month" : "week")"
        } else if percentageChange < 0 {
            return "\(String(format: "%.1f", percentageChange))% from last \(period == 0 ? "month" : "week")"
        } else {
            return "No change from last \(period == 0 ? "month" : "week")"
        }
    }
    
    // MARK: - Helper Methods
    
    func navigateDate(_ step: Int) {
        let calendar = Calendar.current
        if period == 1 {
            currentDate = calendar.date(byAdding: .weekOfYear, value: step, to: currentDate) ?? currentDate
        } else {
            currentDate = calendar.date(byAdding: .month, value: step, to: currentDate) ?? currentDate
        }
    }
    
    func totalLoggedMealsCount(for offset: Int) -> Int {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: period == 0 ? .month : .weekOfYear,
                                value: offset,
                                to: currentDate) ?? currentDate
        let range = period == 0 ? calendar.dateInterval(of: .month, for: date) :
                                  calendar.dateInterval(of: .weekOfYear, for: date)
        
        return meals.filter {
            $0.isLogged &&
            ($0.timeGiven >= (range?.start ?? Date()) &&
            $0.timeGiven <= (range?.end ?? Date()))
        }.count
    }
    
    // MARK: - Private Helpers
    
    private func displayMonths() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        let startMonth = formatter.string(from: Calendar.current.startOfMonth(for: currentDate))
        let endMonth = formatter.string(from: Calendar.current.endOfMonth(for: currentDate))
        return startMonth == endMonth ? startMonth : "\(startMonth), \(endMonth)"
    }
    
    private func displayWeeks() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        let startOfWeek = Calendar.current.startOfWeek(for: currentDate)
        let endOfWeek = Calendar.current.endOfWeek(for: currentDate)
        let weekOfYear = Calendar.current.component(.weekOfYear, from: startOfWeek)
        
        let startMonth = formatter.string(from: startOfWeek)
        let endMonth = formatter.string(from: endOfWeek)
        
        return startMonth == endMonth ?
            "\(startMonth), Week \(weekOfYear)" :
            "\(startMonth) - \(endMonth), Week \(weekOfYear)"
    }
}
