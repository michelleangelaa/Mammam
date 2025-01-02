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
    @Bindable var baby: Baby
    @Environment(\.modelContext) var modelContext
    
    private let emojis = ["👶", "👦", "👧", "🧒", "👩‍🦱", "👨‍🦱", "👩‍🦰", "👨‍🦰"]
    
    @State private var selectedEmoji: String = ""
    @State private var isDateValid: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Profile image placeholder
//                    Circle()
//                        .fill(Color.pink.opacity(0.2))
//                        .frame(width: 100, height: 100)
//                        .overlay(
//                            Text(selectedEmoji.isEmpty ? (baby.babyProfileImage.isEmpty ? "👶" : baby.babyProfileImage) : selectedEmoji)
//                                .font(.system(size: 50))
//                        )
                    
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
                        TextField("Enter baby's name", text: $baby.babyName)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    // Birthdate field
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Baby's Birthdate")
                            .font(.headline)
                        DatePicker("Select baby's birthdate",
                                 selection: $baby.babyBirthDate,
                                 displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .labelsHidden()
                            .onChange(of: baby.babyBirthDate) { newDate in
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
        }
    }
    
    private func updateBabyProfile() {
        if !selectedEmoji.isEmpty {
            baby.babyProfileImage = selectedEmoji
        }
        
        guard isDateValid else {
            print("Invalid date selected.")
            return
        }
        
        do {
            try modelContext.save()
            dismiss()
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
        return UpdateBabyProfileView(baby: baby)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
