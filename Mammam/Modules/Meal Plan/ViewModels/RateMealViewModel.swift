//
//  RateMealViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 02/02/25.
//

import PhotosUI
import SwiftData
import SwiftUI

class RateMealViewModel: ObservableObject {
    @Published var ingredient: String
    @Published var type: String
    @Published var timeGiven: Date
    @Published var timeEnded: Date
    @Published var servingUnit: String
    @Published var servingQty: Double
    @Published var consumedQty: Double
    @Published var isAllergic: Bool
    @Published var notes: String
    @Published var selectedPhotoItem: PhotosPickerItem?
    @Published var selectedPhotoData: Data?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var navigateToMealFeedback: Bool = false

    var meal: Meal
    let units = ["Tea Spoon", "Table Spoon", "Cup"]

    init(meal: Meal) {
        self.meal = meal
        self.ingredient = meal.ingredient?.name ?? ""
        self.type = meal.type
        self.timeGiven = meal.timeGiven
        self.timeEnded = meal.timeEnded
        self.servingUnit = meal.servingUnit
        self.servingQty = meal.servingQty
        self.consumedQty = meal.consumedQty
        self.isAllergic = meal.isAllergic
        self.notes = meal.notes
        self.selectedPhotoData = meal.photo
    }

    // MARK: - 🛠 **Fix: Ensure Alert Shows Only Once**

    private func triggerAlert(message: String) {
        DispatchQueue.main.async {
            if !self.showAlert { // ✅ Prevent multiple pop-ups
                self.alertMessage = message
                self.showAlert = true
            }
        }
    }

    // MARK: - **Updated Validation Methods**

    func validateTimes() {
        if timeEnded < timeGiven {
            triggerAlert(message: "Time ended must be later than or equal to time given.")
        }
    }

    func validateQuantities() {
        if consumedQty > servingQty {
            triggerAlert(message: "Consumed quantity cannot be more than the serving size (\(servingQty) \(servingUnit)).")
        }
    }

    func validateInputs() -> Bool {
        if timeEnded < timeGiven {
            triggerAlert(message: "Time ended must be later than or equal to time given.")
            return false
        }
        if consumedQty > servingQty {
            triggerAlert(message: "Consumed quantity cannot be more than the serving size (\(servingQty) \(servingUnit)).")
            return false
        }
        return true
    }

    // MARK: - Update Meal

    func updateMeal(context: ModelContext) {
        if !validateInputs() { return } 

        meal.isLogged = true
        meal.ingredient?.name = ingredient

        if let ingredientNutrients = meal.ingredient?.nutrients {
            for nutrient in ingredientNutrients {
                nutrient.nutrientCount += 1
            }
        }

        meal.type = type
        meal.timeGiven = timeGiven
        meal.timeEnded = timeEnded
        meal.servingUnit = servingUnit
        meal.servingQty = servingQty
        meal.consumedQty = consumedQty
        meal.isAllergic = isAllergic
        meal.notes = notes
        meal.photo = selectedPhotoData

        do {
            try context.save()
            DispatchQueue.main.async {
                self.navigateToMealFeedback = true
            }
        } catch {
            print("Error saving meal: \(error)")
        }
    }

    func handlePhotoSelection() async {
        guard let photoItem = selectedPhotoItem else { return }
        do {
            if let data = try await photoItem.loadTransferable(type: Data.self) {
                DispatchQueue.main.async {
                    self.selectedPhotoData = data
                }
            }
        } catch {
            print("Error loading photo: \(error.localizedDescription)")
        }
    }
}
