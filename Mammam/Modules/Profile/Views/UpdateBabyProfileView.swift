//
//  UpdateBabyProfileView.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.
//

import SwiftUI
import SwiftData

struct UpdateBabyProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var babyName:String = ""
    @State private var babyBirthDate: Date = Date.distantPast
    @State private var selectedEmoji:String = ""

    let baby : Baby

    private let emojis = ["👶", "👦", "👧", "🧒", "👩‍🦱", "👨‍🦱", "👩‍🦰", "👨‍🦰"]
    
    var isUpdated: Bool {
           return !babyName.isEmpty && babyBirthDate != Date.distantPast && !selectedEmoji.isEmpty
       }

    
    var body: some View {
        NavigationView {
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
                }
                
                // Baby's Name
                VStack(alignment: .leading, spacing: 5) {
                    Text("Baby’s Name")
                        .font(.headline)
                TextField("Enter baby's name", text: $babyName)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                }
                
                // Baby's Birthdate
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
                
                // Update Button
                CustomLargeButtonComponent(
                    state: isUpdated ? .enabled : .disabled,
                    text: "Continue",
                    action: {
                        // Update the baby's profile
                                              baby.babyBirthDate = babyBirthDate
                                              baby.babyName = babyName
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
    }
    
    
}

#Preview {
    UpdateBabyProfileView()
        .modelContainer(baby: Baby)
}
