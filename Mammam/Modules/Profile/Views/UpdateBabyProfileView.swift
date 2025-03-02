// UpdateBabyProfileView.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.

import SwiftData
import SwiftUI

struct UpdateBabyProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @StateObject private var viewModel: UpdateBabyProfileViewModel

    private let emojis = ["👶", "👦", "👧", "🧒", "👩‍🦱", "👨‍🦱", "👩‍🦰", "👨‍🦰"]

    init(baby: Baby) {
        _viewModel = StateObject(wrappedValue: UpdateBabyProfileViewModel(baby: baby)) // ✅ No need to pass context
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
                        Text(viewModel.selectedEmoji.isEmpty ? viewModel.baby.babyProfileImage : viewModel.selectedEmoji)
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
                                        .fill(viewModel.selectedEmoji == emoji ? Color.rose.rose25 : Color.clear)
                                )
                                .onTapGesture {
                                    viewModel.selectedEmoji = emoji
                                }
                        }
                    }
                }

                // Name Input
                VStack(alignment: .leading, spacing: 5) {
                    Text("Baby’s Name")
                        .font(.headline)
                    TextField("Enter baby's name", text: $viewModel.name)
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
                        DatePicker("", selection: $viewModel.date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                        Spacer()
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .onChange(of: viewModel.date) { newDate in
                        viewModel.isDateValid = viewModel.isDateValidFunction(newDate)
                    }

                    if !viewModel.isDateValid {
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
                    action: {
                        viewModel.updateBabyProfile()
                        if !viewModel.showAlert {
                            coordinator.pop()
                        }
                    }
                )
                .padding(.horizontal)
            }
            .padding(.horizontal)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Invalid Input"),
                    message: Text(viewModel.alertMessage),
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
}
