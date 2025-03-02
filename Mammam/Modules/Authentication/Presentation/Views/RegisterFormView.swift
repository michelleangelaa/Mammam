//
//  RegisterFormView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import SwiftData
import SwiftUI

struct RegisterFormView: View {
    @StateObject private var viewModel: RegisterFormViewModel
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator: Coordinator

    public init(viewModel: RegisterFormViewModel = RegisterFormViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            indicatorbar(totalCount: viewModel.totalSteps, currentIndex: viewModel.currentStep)

            Group {
                switch viewModel.currentStep {
                case 1:
                    InputBabyNameView(babyName: $viewModel.babyName)
                case 2:
                    InputBabyAgeView(birthdate: $viewModel.birthdate)
                case 3:
                    InputBabyAllergiesView(selectedAllergies: $viewModel.selectedAllergies)
                default:
                    EmptyView()
                }
            }

            Spacer()

            CustomLargeButtonComponent(
                state: viewModel.isFormValid() ? .enabled : .disabled,
                text: "Continue",
                action: {
                    viewModel.goToNextStep(context: context, coordinator: coordinator)
                }
            )
            .padding(.horizontal)
        }
        .padding()
        .navigationBarBackButtonHidden()
    }

    struct InputBabyNameView: View {
        @Binding var babyName: String

        var body: some View {
            VStack(spacing: 16) {
                Text("👶")
                    .font(.system(size: 80))
                    .padding(.bottom, 40)

                VStack(alignment: .leading) {
                    Text("Baby's Name")
                        .font(.headline)
                }

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
                    .padding(.bottom, 40)

                VStack(alignment: .leading) {
                    Text("Baby's Birthdate")
                        .font(.headline)
                }

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
                Text("😷")
                    .font(.system(size: 80))
                    .padding(.bottom, 40)

                Text("Food Restrictions")
                    .font(.headline)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                    ForEach($localAllergens, id: \.self) { allergen in
                        AllergyCardComponent(allergen: allergen) { toggledAllergen in
                            if let index = localAllergens.firstIndex(where: { $0.name == toggledAllergen.name }) {
                                localAllergens[index] = toggledAllergen
                                if toggledAllergen.isAllergy {
                                    selectedAllergies.insert(toggledAllergen.name)
                                    selectedAllergies.insert(toggledAllergen.image)
                                } else {
                                    selectedAllergies.remove(toggledAllergen.name)
                                    selectedAllergies.insert(toggledAllergen.image)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .padding(.horizontal)
            .onAppear {
                localAllergens = allergens.map { allergen in
                    let isSelected = selectedAllergies.contains(allergen.name)
                    return Allergen(name: allergen.name, image: allergen.image, isAllergy: isSelected)
                }
            }
        }
    }
}
