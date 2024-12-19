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
    @State private var navigateToMealFeedback = false // State to trigger navigation
    
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
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var units = ["Tea Spoon", "Table Spoon", "Cup"]

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
                        let meal = Meal(type: type, timeGiven: timeGiven, timeEnded: timeEnded, servingUnit:servingUnit,servingQty: servingQty, consumedQty: consumedQty,isAllergic: isAllergic, isLogged: isLogged, notes: notes)
                        context.insert(meal)
                        navigateToMealFeedback = true
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Submit")
                }
                .buttonStyle(.borderedProminent)
                .navigationDestination(isPresented: $navigateToMealFeedback) {
                    MealFeedbackView() // This will show RateMealView within the same sheet
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }

        }
    }

    // Validation Logic
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


#Preview {
    RateMealView()
}
