//
//  UpdateBabyProfileViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 31/01/25.
//

import Foundation
import SwiftUI

class UpdateBabyProfileViewModel: ObservableObject {
    @Published var baby: Baby
    @Published var selectedEmoji: String
    @Published var name: String
    @Published var date: Date
    @Published var isDateValid: Bool = true
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""

    @Environment(\.modelContext) private var context

    init(baby: Baby) {
        self.baby = baby
        self.selectedEmoji = baby.babyProfileImage
        self.name = baby.babyName
        self.date = baby.babyBirthDate
    }

    // MARK: - Update Profile Logic

    func updateBabyProfile() {
        guard validateInputs() else {
            showAlert = true
            return
        }

        baby.babyProfileImage = selectedEmoji.isEmpty ? baby.babyProfileImage : selectedEmoji
        baby.babyName = name
        baby.babyBirthDate = date

        do {
            try context.save()
            print("Baby profile updated successfully.")
        } catch {
            alertMessage = "Failed to save: \(error.localizedDescription)"
            showAlert = true
            print("Failed to save: \(error.localizedDescription)")
        }
    }

    // MARK: - Validation Logic

    private func validateInputs() -> Bool {
        if !isDateValidFunction(date) {
            alertMessage = "Please select a valid date (not in the future)."
            return false
        }
        if name.isEmpty {
            alertMessage = "Please enter baby's name."
            return false
        }
        return true
    }

    func isDateValidFunction(_ date: Date) -> Bool {
        return date <= Date()
    }
}
