// UpdateBabyProfileView.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.


import SwiftUI
import SwiftData
struct UpdateBabyProfileView: View {
    var body: some View {
        Text("Hello World")
    }
}
#Preview {
    UpdateBabyProfileView()
}

//struct UpdateBabyProfileView: View {
    //    @Environment(\.dismiss) var dismiss
    //    @Bindable var baby : Baby
    //    @Environment(\.modelContext) var modelContext
    //
    //    private let emojis = ["👶", "👦", "👧", "🧒", "👩‍🦱", "👨‍🦱", "👩‍🦰", "👨‍🦰"]
    //
    //    @State private var selectedEmoji: String = ""
    //    @State private var isDateValid: Bool = true
    //    var baby: Baby
    
//    var body: some View {
//     Text("coba")
        //        NavigationStack {
        //            ScrollView {
        //                VStack(spacing: 20) {
        //                    //Profile image placeholder
        //                    Circle()
        //                        .fill(Color.pink.opacity(0.2))
        //                        .frame(width: 100, height: 100)
        //                        .overlay(
        //                            Text(selectedEmoji.isEmpty ? (baby.babyProfileImage.isEmpty ? "👶" : baby.babyProfileImage) : selectedEmoji)
        //                                .font(.system(size: 50))
        //                        )
        //
        //                    // selection
        //                    HStack(spacing: 10) {
        //                        ScrollView(.horizontal, showsIndicators: false) {
        //                            HStack {
        //                                ForEach(emojis, id: \.self) { emoji in
        //                                    Text(emoji)
        //                                        .font(.largeTitle)
        //                                        .padding()
        //                                        .background(
        //                                            Circle()
        //                                                .fill(selectedEmoji == emoji ? Color.pink.opacity(0.2) : Color.clear)
        //                                        )
        //                                        .onTapGesture {
        //                                            selectedEmoji = emoji
        //                                        }
        //                                }
        //                            }
        //                        }
        //
        //
        //                        // name
        //                        VStack(alignment: .leading, spacing: 5) {
        //                            Text("Baby’s Name")
        //                                .font(.headline)
        //                            TextField("Enter baby's name", text: $baby.babyName)
        //                                .padding()
        //                                .background(Color(UIColor.systemGray6))
        //                                .cornerRadius(10)
        //                                .frame(maxWidth: .infinity)
        //                        }
        //
        //                        //birthdate
        //                        VStack(alignment: .leading, spacing: 5) {
        //                            Text("Baby’s Birthdate")
        //                                .font(.headline)
        //                            DatePicker("Select baby's birthdate", selection: $baby.babyBirthDate, displayedComponents: .date)
        //                                .datePickerStyle(.compact)
        //                                .padding()
        //                                .background(Color(UIColor.systemGray6))
        //                                .cornerRadius(10)
        //                                .labelsHidden()
        //                                .onChange(of: baby.babyBirthDate) { newDate in
        //                                    isDateValid = isDateValidFunction(newDate) // Validate date whenever it changes
        //                                }
        //
        //                            if !isDateValid {
        //                                Text("Please select a valid date (not in the future).")
        //                                    .foregroundColor(.red)
        //                                    .font(.footnote)
        //                            }
        //                        }
        //                        Spacer()
        //
        //                        //button
        //                        CustomLargeButtonComponent(
        //                            state: .enabled,
        //                            text: "Update Your Baby's Data",
        //                            action: {
        //                                updateBabyProfile()
        //                            }
        //                        )
        //                        .padding(.horizontal)
        //
        //
        //                    }
        //                    .padding()
        //                    .navigationTitle("Update Baby’s Data")
        //                    .navigationBarTitleDisplayMode(.inline)
        //                }
        //                .toolbar {
        //                    ToolbarItem(placement: .navigationBarTrailing) {
        //                        Button("Done") {
        //                            dismiss()
        //                        }
        //                    }
        //                }
        //            }.navigationTitle("update baby profile")
        //        }
        //    }
        //        private func updateBabyProfile() {
        //                // Assign selected emoji only if it is not empty
        //                if !selectedEmoji.isEmpty {
        //                    baby.babyProfileImage = selectedEmoji
        //                }
        //
        //                // Check if the date is valid before saving
        //                guard isDateValid else {
        //                    print("Invalid date selected.")
        //                    return
        //                }
        //
        //                do {
        //                    try modelContext.save() // Save changes to the context
        //                    dismiss() // Dismiss the view after saving
        //                } catch {
        //                    print("Failed to save: \(error.localizedDescription)")
        //                }
        //            }
        //
        //        // MARK: - function helper
        //            func isDateValidFunction(_ date: Date) -> Bool {
        //                    let currentDate = Date()
        //                    return date <= currentDate // Check if the date is in the past or today
        //                }
//    }
//}
//    


// MARK: - Sample Data for Preview

//extension Baby {
//    static var samplesBaby: Baby {
//
//            Baby(
//                babyProfileImage: "i_profile_person",
//                babyName: "eve",
//                babyBirthDate: Date()
//            )
//
//
//    }
//}


// MARK: - Preview
//#Preview {
//    UpdateBabyProfileView(baby: Baby.samplesBaby)
//}
