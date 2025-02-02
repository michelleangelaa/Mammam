//
//  MealFeedbackViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 02/02/25.
//

import Foundation
import SwiftUI

class MealFeedbackViewModel: ObservableObject {
    @Published var meal: Meal

    init(meal: Meal) {
        self.meal = meal
    }

    var mealType: String {
        meal.type
    }

    var mealDate: String {
        formattedDate(meal.timeGiven)
    }

    var feedbackMessage: String {
        meal.consumedQty >= meal.servingQty - 1.0
            ? "Even a little progress counts. New foods take time to become favorites."
            : "Don’t worry, mom! It’s all part of the journey. Keep trying—your patience is building their love for food."
    }

    var allergyMessage: String {
        meal.isAllergic
            ? "There is a reaction to \(meal.ingredient?.name ?? "this ingredient"). Let’s explore safer options next time."
            : "No allergic reactions today — great job introducing new tastes!"
    }

    var allergyColor: Color {
        meal.isAllergic ? .red : .green
    }

    var allergyBackgroundColor: Color {
        meal.isAllergic ? Color.red.opacity(0.2) : Color.green.opacity(0.2)
    }

    var totalMealTime: String {
        "\(meal.durationInMinutes) minutes"
    }

    var timeRange: String {
        "\(formatTime(meal.timeGiven)) - \(formatTime(meal.timeEnded))"
    }

    enum IconType {
        case filled, empty
    }

    var consumptionIcons: [(id: Int, type: IconType)] {
        (0..<Int(meal.servingQty)).map { index in
            let iconType: IconType = index < Int(meal.consumedQty) ? .filled : .empty
            return (id: index, type: iconType)
        }
    }

    var notes: String {
        meal.notes
    }

    var photo: UIImage? {
        guard let photoData = meal.photo else { return nil }
        return UIImage(data: photoData)
    }

    // MARK: - Private Helpers

    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM"
        return formatter.string(from: date)
    }

    func iconForType(_ type: IconType) -> String {
        switch type {
        case .filled:
            return filledIconForServingUnit(meal.servingUnit)
        case .empty:
            return emptyIconForServingUnit(meal.servingUnit)
        }
    }

    private func filledIconForServingUnit(_ unit: String) -> String {
        switch unit.lowercased() {
        case "cup":
            return "i_logmealform_cup2"
        case "tsp", "tbsp":
            return "i_logmealform_spoon"
        default:
            return "i_logmealform_spoon"
        }
    }

    private func emptyIconForServingUnit(_ unit: String) -> String {
        switch unit.lowercased() {
        case "cup":
            return "i_logmealform_notfilledcup2"
        case "tsp", "tbsp":
            return "i_logmealform_notfilledspoon"
        default:
            return "i_logmealform_notfilledspoon"
        }
    }
}
