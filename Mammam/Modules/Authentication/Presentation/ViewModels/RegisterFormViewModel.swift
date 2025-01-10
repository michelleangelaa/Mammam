//
//  RegisterFormViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 10/01/25.
//

import Foundation
import SwiftUI
import SwiftData

class RegisterFormViewModel: ObservableObject {
    @Published var currentStep: Int = 1
    @Published var babyName: String = ""
    @Published var birthdate: Date = .init()
    @Published var selectedAllergies: Set<String> = []
    @Published var isLastStep: Bool = false 

    var totalSteps: Int {
        3
    }

    func isFormValid() -> Bool {
        switch currentStep {
        case 1:
            return !babyName.isEmpty
        case 2:
            return birthdate <= Date()
        case 3:
            return true
        default:
            return false
        }
    }

    func saveBabyData(context: ModelContext, coordinator: Coordinator) {
        do {
            let fetchRequest = FetchDescriptor<User>()
            guard let currentUser = try? context.fetch(fetchRequest).first else {
                print("No user found")
                return
            }

            let newBaby = Baby(
                babyProfileImage: "👶",
                babyName: babyName,
                babyBirthDate: birthdate,
                user: currentUser
            )

            currentUser.baby = newBaby
            context.insert(newBaby)

            let allergenFetchDescriptor = FetchDescriptor<Allergen>()
            let allAllergens = try context.fetch(allergenFetchDescriptor)

            for allergen in allAllergens {
                allergen.isAllergy = selectedAllergies.contains(allergen.name)
            }

            try context.save()
            print("Baby and allergen data saved successfully!")

            coordinator.selectedTab = .home
            coordinator.push(page: .main)

        } catch {
            print("Error saving data: \(error)")
        }
    }

    func goToNextStep(context: ModelContext?, coordinator: Coordinator?) {
        if currentStep < totalSteps {
            currentStep += 1
        } else {
            isLastStep = true
            if let context = context, let coordinator = coordinator {
                saveBabyData(context: context, coordinator: coordinator)
            }
        }
    }
}
