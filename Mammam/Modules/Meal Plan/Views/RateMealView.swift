//
//  RateMealView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import SwiftData
import SwiftUI

struct RateMealView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    
    @State private var navigateToMealFeedback = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    // Passed-in Meal
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
    @State private var isLogged: Bool = true
    @State private var notes: String = ""

    var units = ["Tea Spoon", "Table Spoon", "Cup"]

    init(meal: Meal) {
        // Initialize the meal as a State property
        _meal = State(initialValue: meal)

        // Copy properties into local form states
        _ingredient = State(initialValue: meal.ingredient?.name ?? "")
        _type = State(initialValue: meal.type)
        _timeGiven = State(initialValue: meal.timeGiven)
        _timeEnded = State(initialValue: meal.timeEnded)
        _servingUnit = State(initialValue: meal.servingUnit)
        _servingQty = State(initialValue: meal.servingQty)
        _consumedQty = State(initialValue: meal.consumedQty)
        _isAllergic = State(initialValue: meal.isAllergic)
        _isLogged = State(initialValue: meal.isLogged)
        _notes = State(initialValue: meal.notes)
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("Review Meal")
                    .font(.title2).fontWeight(.bold)

                Form {
                    TextField("Ingredient Name", text: $ingredient)
                    TextField("Type", text: $type)
                    DatePicker("Time Given", selection: $timeGiven, displayedComponents: .hourAndMinute)
                    DatePicker("Time Ended", selection: $timeEnded, displayedComponents: .hourAndMinute)
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
                        Text("Allergic Reaction")
                        Picker("Allergic Reaction", selection: $isAllergic) {
                            Text("Yes").tag(true)
                            Text("No").tag(false)
                        }
                        .pickerStyle(.segmented)
                    }

                    TextField("Notes", text: $notes)
                }

                Button {
                    if validateInputs() {
                        updateMeal()  // <--- We call updateMeal() now
                        navigateToMealFeedback = true
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Submit")
                }
                .buttonStyle(.borderedProminent)
                .navigationDestination(isPresented: $navigateToMealFeedback) {
                    MealFeedbackView(meal: meal, fromRateMealView: true)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid Input"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }

    // MARK: - Update the existing Meal
    private func updateMeal() {
        meal.isLogged = true // Force isLogged to true if you want

        // Update fields
        meal.ingredient?.name = ingredient
        meal.type = type
        meal.timeGiven = timeGiven
        meal.timeEnded = timeEnded
        meal.servingUnit = servingUnit
        meal.servingQty = servingQty
        meal.consumedQty = consumedQty
        meal.isAllergic = isAllergic
        meal.notes = notes

        // Save changes
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
            alertMessage = "Time Ended must be later than or equal to Time Given."
            showAlert = true
        }
    }

    private func validateQuantities() {
        if consumedQty > servingQty {
            alertMessage = "Consumed quantity cannot exceed the serving size."
            showAlert = true
        }
    }
}

//#Preview {
//    RateMealView(meal: <#Meal#>)
//}
