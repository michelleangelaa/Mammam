//
//  UpdateBabyProfileView.swift
//  Mammam
//
//  Created by Evelyn Santoso on 02/01/25.
//

import SwiftUI
import SwiftData

struct UpdateBabyProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Bindable var baby: Baby
    
    private let emojis = ["👶", "👦", "👧", "🧒", "👩‍🦱", "👨‍🦱", "👩‍🦰", "👨‍🦰"]
    
    @State private var selectedEmoji: String = ""
    @State private var newBabyName: String = ""
    @State private var selectedDate: Date = Date()
    @State private var isDateValid: Bool = true
    @State private var showAlert: Bool = false
    
    init(baby: Baby) {
        self.baby = baby
        _newBabyName = State(initialValue: baby.babyName)
        _selectedDate = State(initialValue: baby.babyBirthDate)
        _selectedEmoji = State(initialValue: baby.babyProfileImage)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Profile image placeholder
                    Circle()
                        .fill(Color.pink.opacity(0.2))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Text(selectedEmoji.isEmpty ? "👶" : selectedEmoji)
                                .font(.system(size: 50))
                        )
                    
                    // Emoji selection
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(emojis, id: \.self) { emoji in
                                Text(emoji)
                                    .font(.largeTitle)
                                    .padding()
                                    .background(
                                        Circle()
                                            .fill(selectedEmoji == emoji ? Color.pink.opacity(0.2) : Color.clear)
                                    )
                                    .onTapGesture {
                                        selectedEmoji = emoji
                                    }
                            }
                        }
                    }
                    
                    // Name field
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Baby's Name")
                            .font(.headline)
                        TextField("Enter baby's name", text: $newBabyName)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .textInputAutocapitalization(.words)
                    }
                    
                    // Birthdate field
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Baby's Birthdate")
                            .font(.headline)
                        DatePicker("Select baby's birthdate",
                                 selection: $selectedDate,
                                 displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .labelsHidden()
                            .onChange(of: selectedDate) { newDate in
                                isDateValid = isDateValidFunction(newDate)
                            }
                        
                        if !isDateValid {
                            Text("Please select a valid date (not in the future).")
                                .foregroundColor(.red)
                                .font(.footnote)
                        }
                    }
                    
                    // Update button
                    CustomLargeButtonComponent(
                        state: .enabled,
                        text: "Update Your Baby's Data",
                        action: {
                            updateBabyProfile()
                        }
                    )
                    .padding(.top, 20)
                }
                .padding()
            }
            .navigationTitle("Update Baby's Data")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .alert("Update Successful", isPresented: $showAlert) {
                Button("OK") {
                    dismiss()
                }
            } message: {
                Text("Baby's profile has been updated successfully.")
            }
        }
    }
    
    private func updateBabyProfile() {
        guard isDateValid else {
            print("Invalid date selected.")
            return
        }
        
        // Update the baby's properties
        baby.babyProfileImage = selectedEmoji.isEmpty ? "👶" : selectedEmoji
        baby.babyName = newBabyName.isEmpty ? baby.babyName : newBabyName
        baby.babyBirthDate = selectedDate
        
        do {
            try modelContext.save()
            showAlert = true
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
    
    private func isDateValidFunction(_ date: Date) -> Bool {
        let currentDate = Date()
        return date <= currentDate
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Baby.self, configurations: config)
        let baby = Baby(babyProfileImage: "👶", babyName: "Eve", babyBirthDate: Date())
        container.mainContext.insert(baby)
        return UpdateBabyProfileView(baby: baby)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
