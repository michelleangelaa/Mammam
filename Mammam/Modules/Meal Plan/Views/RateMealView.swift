//
//  RateMealView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import PhotosUI
import SwiftData
import SwiftUI

struct RateMealView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context

    @State private var navigateToMealFeedback = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    @State var meal: Meal

    // Local State for form fields
    @State private var ingredient: String = ""
    @State private var type: String = ""
    @State private var timeGiven: Date = .now
    @State private var timeEnded: Date = .now
    @State private var servingUnit: String = "Tea Spoon"
    @State private var servingQty: Double = 1.0
    @State private var consumedQty: Double = 1.0
    @State private var isAllergic: Bool = false
    @State private var notes: String = ""
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedPhotoData: Data?

    var units = ["Tea Spoon", "Table Spoon", "Cup"]

    init(meal: Meal) {
        _meal = State(initialValue: meal)

        _ingredient = State(initialValue: meal.ingredient?.name ?? "")
        _type = State(initialValue: meal.type)
        _timeGiven = State(initialValue: meal.timeGiven)
        _timeEnded = State(initialValue: meal.timeEnded)
        _servingUnit = State(initialValue: meal.servingUnit)
        _servingQty = State(initialValue: meal.servingQty)
        _consumedQty = State(initialValue: meal.consumedQty)
        _isAllergic = State(initialValue: meal.isAllergic)
        _notes = State(initialValue: meal.notes)
        _selectedPhotoData = State(initialValue: meal.photo)
    }

    var body: some View {
        VStack {
            Text("Review meal")
                .font(.title2).fontWeight(.bold)
                .padding(.top, 4)

            Form {
//                TextField("Ingredient Name", text: $ingredient)
//                TextField("Type", text: $type)
                DatePicker("Time given", selection: $timeGiven, displayedComponents: .hourAndMinute)
                DatePicker("Time ended", selection: $timeEnded, displayedComponents: .hourAndMinute)
                    .onChange(of: timeEnded) { _ in
                        validateTimes()
                    }

                HStack {
                    Text("Meal serving size")
                    Spacer()
                    HStack {
                        TextField("Qty", value: $servingQty, format: .number)
                            .keyboardType(.decimalPad)
                            .fixedSize()
                        Picker("", selection: $servingUnit) {
                            ForEach(units, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .labelsHidden()
                    }
                }

                HStack {
                    Text("Meal consumed")
                    Spacer()
                    HStack {
                        TextField("Qty", value: $consumedQty, format: .number)
                            .keyboardType(.decimalPad)
                            .fixedSize()
                            .onChange(of: consumedQty) { _ in
                                validateQuantities()
                            }
                        Picker("", selection: $servingUnit) {
                            ForEach(units, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .labelsHidden()
                    }
                }

                HStack {
                    Text("Allergic reaction")
                    Picker("Allergic reaction", selection: $isAllergic) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }
                    .pickerStyle(.segmented)
                }

                VStack(alignment: .leading) {
                    TextField("Notes", text: $notes)
                    PhotosPicker(
                        selection: $selectedPhoto,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Group {
                            if let selectedPhotoData,
                               let uiImage = UIImage(data: selectedPhotoData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100) // Adjust size as needed
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            } else {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.rose.rose50)
                                    .frame(width: 100, height: 100) // Adjust size as needed
                                    .overlay(
                                        Image(systemName: "camera.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(Color.rose.rose700)
                                    )
                            }
                        }
                        .frame(width: 100, height: 100)
                        .overlay(alignment: .bottomTrailing) {
                            if selectedPhotoData != nil {
                                Button {
                                    selectedPhoto = nil
                                    selectedPhotoData = nil
                                } label: {
                                    Image(systemName: "x.circle.fill")
                                        .foregroundStyle(.rose500)
                                }
                            }
                        }
                    }
                }
            }

            // Save Button with Validation
            Button(action: {
                if validateInputs() {
                    updateMeal()
                    navigateToMealFeedback = true
                } else {
                    showAlert = true
                }
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(validateInputs() ? Color.rose.rose500 : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!validateInputs()) // Disable button if inputs are invalid
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid Input"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }

            NavigationLink(
                destination: MealFeedbackView(meal: meal, fromRateMealView: true),
                isActive: $navigateToMealFeedback
            ) {
                EmptyView()
            }
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                selectedPhotoData = data
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Close") {
                    coordinator.dismissSheet()
                }
            }
        }
    }

    // MARK: - Update the existing Meal

    private func updateMeal() {
        meal.isLogged = true

        meal.ingredient?.name = ingredient

        // Increment nutrient counts
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
            print("Meal updated and saved!")
        } catch {
            print("Error updating meal: \(error)")
        }
    }

    // MARK: - Validation

    private func validateInputs() -> Bool {
        if timeEnded < timeGiven {
            alertMessage = "Time Ended must be later than or equal to Time Given."
            return false
        }
        if consumedQty > servingQty {
            alertMessage = "Consumed quantity cannot exceed the serving size."
            return false
        }
        return true
    }

    private func validateTimes() {
        if timeEnded < timeGiven {
            DispatchQueue.main.async {
                alertMessage = "Time Ended must be later than or equal to Time Given."
                showAlert = true
            }
        }
    }

    private func validateQuantities() {
        if consumedQty > servingQty {
            DispatchQueue.main.async {
                alertMessage = "Consumed quantity cannot exceed the serving size."
                showAlert = true
            }
        }
    }
}

// #Preview {
//    RateMealView(meal: <#Meal#>)
// }
