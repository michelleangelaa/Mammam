// UpdateBabyProfileView.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.

import SwiftData
import SwiftUI

struct UpdateBabyProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss

    @State var baby: Baby
    @State private var selectedEmoji: String = ""
    @State private var isDateValid: Bool = true
    @State private var name: String
    @State private var date: Date

    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    private let emojis = ["👶", "👦", "👧", "🧒", "👩‍🦱", "👨‍🦱", "👩‍🦰", "👨‍🦰"]

    init(baby: Baby) {
        self._baby = State(initialValue: baby)
        self._selectedEmoji = State(initialValue: baby.babyProfileImage)
        self._name = State(initialValue: baby.babyName)
        self._date = State(initialValue: baby.babyBirthDate)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Update Baby's Data")
                    .font(.title3)
                    .fontWeight(.bold)

                // Profile Image
                Circle()
                    .fill(Color.pink.opacity(0.2))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text(selectedEmoji.isEmpty ? baby.babyProfileImage : selectedEmoji)
                            .font(.system(size: 50))
                    )

                // Emoji Selection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(emojis, id: \.self) { emoji in
                            Text(emoji)
                                .font(.largeTitle)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(selectedEmoji == emoji ? Color.rose.rose25 : Color.clear)
                                )
                                .onTapGesture {
                                    selectedEmoji = emoji
                                }
                        }
                    }
                }

                // Name Input
                VStack(alignment: .leading, spacing: 5) {
                    Text("Baby’s Name")
                        .font(.headline)
                    TextField("Enter baby's name", text: $name)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                }
                .padding()

                // Birthdate Input
                VStack(alignment: .leading, spacing: 5) {
                    Text("Baby’s Birthdate")
                        .font(.headline)

                    HStack {
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden() // Hides the default label for the DatePicker
                        Spacer() // Ensures the DatePicker stays on the leading side
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .onChange(of: date) { newDate in
                        isDateValid = isDateValidFunction(newDate)
                    }

                    if !isDateValid {
                        Text("Please select a valid date (not in the future).")
                            .foregroundColor(.red)
                            .font(.footnote)
                    }
                }
                .padding()


                // Update Button
                CustomLargeButtonComponent(
                    state: .enabled,
                    text: "Update Your Baby's Data",
                    action: updateBabyProfile
                )
                .padding(.horizontal)
            }
            .padding(.horizontal)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Done") {
//                        dismiss()
//                    }
//                }
//            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid Input"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    coordinator.pop()
                } label: {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
        }
    }

    // MARK: - Update Function

    private func updateBabyProfile() {
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
            coordinator.pop() // Use coordinator to navigate back
        } catch {
            alertMessage = "Failed to save: \(error.localizedDescription)"
            showAlert = true
            print("Failed to save: \(error.localizedDescription)")
        }
    }

    // MARK: - Validation

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

    private func isDateValidFunction(_ date: Date) -> Bool {
        return date <= Date()
    }
}

// MARK: - Sample Data for Preview

// extension Baby {
//    static var sampleBaby: Baby {
//        Baby(
//            babyProfileImage: "👶",
//            babyName: "Eve",
//            babyBirthDate: Calendar.current.date(byAdding: .year, value: -1, to: Date()) ?? Date()
//        )
//    }
// }
//
//// MARK: - Preview
// #Preview {
//    UpdateBabyProfileView(baby: Baby.sampleBaby)
// }
