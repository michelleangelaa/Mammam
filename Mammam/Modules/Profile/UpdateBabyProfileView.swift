// UpdateBabyProfileView.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.


import SwiftUI
import SwiftData

struct UpdateBabyProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var baby : Baby
//    @Environment(\.modelContext) var modelContext

    private let emojis = ["👶", "👦", "👧", "🧒", "👩‍🦱", "👨‍🦱", "👩‍🦰", "👨‍🦰"]
        
    @State private var selectedEmoji: String = ""
//    var baby: Baby

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    //Profile image placeholder
                    Circle()
                        .fill(Color.pink.opacity(0.2))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Text(selectedEmoji.isEmpty ? "👶" : selectedEmoji)
                            .font(.system(size: 50))
                        )
                    
                    // selection
                    HStack(spacing: 10) {
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
                        
                        
                       // name
                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Baby’s Name")
                                                .font(.headline)
                                        TextField("Enter baby's name", text: $babyName)
                                                .padding()
                                                .background(Color(UIColor.systemGray6))
                                                .cornerRadius(10)
                                                .frame(maxWidth: .infinity)
                                        }
                        
                        //birthdate
                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Baby’s Birthdate")
                                                .font(.headline)
                                            DatePicker("Select baby's birthdate", selection: $babyBirthDate, displayedComponents: .date)
                                                .datePickerStyle(.compact)
                                                .padding()
                                                .background(Color(UIColor.systemGray6))
                                                .cornerRadius(10)
                                                .labelsHidden()
                                        }
                        Spacer()
                        
                        //button
                        CustomLargeButtonComponent(
                            state: isUpdated ? .enabled : .disabled,
                            text: "Continue",
                            action: {
                                // Update the baby's profile
                                        baby.babyBirthDate = babyBirthDate
                                        baby.babyName = babyName
                                        baby.babyProfileImage = selectedEmoji
                                do {
                                    try modelContext.save()
                                    dismiss()
                                } catch {
                                    print("Failed to save changes: \(error.localizedDescription)")
                                }
                            }
                        )
                    .padding(.horizontal)
                        
                
                }
                    .padding()
                    .navigationTitle("Update Baby’s Data")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }.navigationTitle("update baby profile")
    }
}

// MARK: - Sample Data for Preview

extension Baby {
    static var samplesBaby: Baby {

            Baby(
                babyProfileImage: "i_profile_person",
                babyName: "eve",
                babyBirthDate: Date()
            )


    }
}


// MARK: - Preview
//#Preview {
//    UpdateBabyProfileView(baby: Baby.samplesBaby)
//}
