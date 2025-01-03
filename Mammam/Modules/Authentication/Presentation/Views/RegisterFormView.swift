//
//  RegisterFormView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import SwiftData
import SwiftUI

struct RegisterFormView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    // Passed-in Baby
    // @State var baby: Baby

    // Local State for form fields
    @State private var currentStep = 1
    private let totalSteps = 3
    @State private var babyName: String = ""
    @State private var birthdate = Date()
    @State private var selectedAllergies: Set<String> = []
    @State private var isLastStep = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Progress Indicator
            indicatorbar(totalCount: totalSteps, currentIndex: currentStep)

            // Content for current step
            if currentStep == 1 {
                InputBabyNameView(babyName: $babyName)
            } else if currentStep == 2 {
                InputBabyAgeView(birthdate: $birthdate)
            } else if currentStep == 3 {
                InputBabyAllergiesView(selectedAllergies: $selectedAllergies)
            }

            // Navigation Button
            CustomLargeButtonComponent(
                state: isFormValid() ? .enabled : .disabled,
                text: "Continue",
                action: {
                    if currentStep < totalSteps {
                        currentStep += 1
                    } else {
                        isLastStep = true
                        saveBabyData()
                        coordinator.selectedTab = .home
                        coordinator.push(page: .main)
                    }
                }
            )
            .padding(.horizontal)
        }
        .padding()
        .navigationBarBackButtonHidden()
    }

    // Check if form is valid
    private func isFormValid() -> Bool {
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

    func saveSelectedAllergies(for baby: Baby, selectedAllergies: Set<String>) {
//            let context = container.mainContext

        do {
            // Fetch the allergens matching the selected names
            let fetchDescriptor = FetchDescriptor<Allergen>(
                predicate: #Predicate { selectedAllergies.contains($0.name) }
            )
            let allergens = try context.fetch(fetchDescriptor)

            // Update the baby's allergens
//                baby.allergens = Set(allergens)

            // Save changes to the context
            try context.save()
            print("Allergens saved successfully for baby: \(baby.babyName)")
        } catch {
            print("Error saving selected allergies: \(error)")
        }
    }

    // Save Baby Data
    private func saveBabyData() {
        do {
            // Create a new Baby
            let newBaby = Baby(babyProfileImage: "👶🏻", babyName: babyName, babyBirthDate: birthdate)
            context.insert(newBaby)

            // Update allergens for this baby
            let fetchDescriptor = FetchDescriptor<Allergen>()
            let allAllergens = try context.fetch(fetchDescriptor)

            // Update isAllergy status for each allergen based on selection
            for allergen in allAllergens {
                allergen.isAllergy = selectedAllergies.contains(allergen.name)
            }

            // Save all changes
            try context.save()
            print("Baby and allergen data saved successfully!")

        } catch {
            print("Error saving data: \(error)")
        }
    }
}

// Supporting Views
struct InputBabyNameView: View {
    @Binding var babyName: String

    var body: some View {
        VStack(spacing: 16) {
            Text("Baby's Name")
                .font(.title2)
                .fontWeight(.bold)

            Text("👶")
                .font(.system(size: 80))

            TextField("Name", text: $babyName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
        .padding()
    }
}

struct InputBabyAgeView: View {
    @Binding var birthdate: Date

    var body: some View {
        VStack(spacing: 16) {
            Text("👶")
                .font(.system(size: 80))

            Text("Baby's Birthdate")
                .font(.title2)
                .fontWeight(.bold)

            DatePicker("", selection: $birthdate, displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

struct InputBabyAllergiesView: View {
    @Environment(\.modelContext) private var context
    @Query var allergens: [Allergen]
    @State private var localAllergens: [Allergen] = []
    @Binding var selectedAllergies: Set<String>

    var body: some View {
        VStack(spacing: 16) {
            Text("Food Restrictions")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            // Allergens grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                ForEach(localAllergens, id: \.self) { allergen in
                    AllergyCard(allergen: allergen) { toggledAllergen in
                        if let index = localAllergens.firstIndex(where: { $0.name == toggledAllergen.name }) {
                            localAllergens[index] = toggledAllergen
                            // Update selectedAllergies Set when an allergy is toggled
                            if toggledAllergen.isAllergy {
                                selectedAllergies.insert(toggledAllergen.name)
                            } else {
                                selectedAllergies.remove(toggledAllergen.name)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .onAppear {
            // Initialize the localAllergens array with a copy of allergens
            localAllergens = allergens.map { allergen in
                // Set isAllergy based on whether the allergy is in selectedAllergies
                let isSelected = selectedAllergies.contains(allergen.name)
                return Allergen(name: allergen.name, image: allergen.image, isAllergy: isSelected)
            }
        }
    }
}

// Preview
#Preview {
    RegisterFormView()
        .environmentObject(Coordinator()) // Mock Coordinator if necessary
}
