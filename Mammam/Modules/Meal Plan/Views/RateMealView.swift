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
    @Environment(\.modelContext) private var context
    @StateObject var viewModel: RateMealViewModel
    @EnvironmentObject private var coordinator: Coordinator

    init(meal: Meal) {
        _viewModel = StateObject(wrappedValue: RateMealViewModel(meal: meal))
    }

    var body: some View {
        VStack {
            Text("Review meal")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 4)

            Form {
                DatePicker("Time given", selection: $viewModel.timeGiven, displayedComponents: .hourAndMinute)
                    .onChange(of: viewModel.timeGiven) { _ in
                        viewModel.validateTimes()
                    }
                DatePicker("Time ended", selection: $viewModel.timeEnded, displayedComponents: .hourAndMinute)
                    .onChange(of: viewModel.timeEnded) { _ in
                        viewModel.validateTimes()
                    }

                servingSizeSection
                mealConsumedSection
                allergicReactionSection
                notesAndPhotoSection
            }

            saveButton

            NavigationLink(
                destination: MealFeedbackView(meal: viewModel.meal, fromRateMealView: true),
                isActive: $viewModel.navigateToMealFeedback
            ) {
                EmptyView()
            }
        }
        .task(id: viewModel.selectedPhotoItem) {
            await viewModel.handlePhotoSelection()
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
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Invalid Input"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK"), action: {
                    viewModel.showAlert = false 
                })
            )
        }
    }

    private var saveButton: some View {
        Button(action: {
            if viewModel.validateInputs() {
                viewModel.updateMeal(context: context)
            }
        }) {
            Text("Save")
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.validateInputs() ? Color.rose.rose500 : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .disabled(!viewModel.validateInputs())
    }

    private var mealConsumedSection: some View {
        HStack {
            Text("Meal consumed")
            Spacer()
            HStack {
                TextField("Qty", value: $viewModel.consumedQty, format: .number)
                    .keyboardType(.decimalPad)
                    .fixedSize()
                    .onChange(of: viewModel.consumedQty) { _ in
                        viewModel.validateQuantities()
                    }
                Picker("", selection: $viewModel.servingUnit) {
                    ForEach(viewModel.units, id: \.self) { unit in
                        Text(unit)
                    }
                }
                .labelsHidden()
            }
        }
    }



    private var servingSizeSection: some View {
        HStack {
            Text("Meal serving size")
            Spacer()
            HStack {
                TextField("Qty", value: $viewModel.servingQty, format: .number)
                    .keyboardType(.decimalPad)
                    .fixedSize()
                Picker("", selection: $viewModel.servingUnit) {
                    ForEach(viewModel.units, id: \.self) { unit in
                        Text(unit)
                    }
                }
                .labelsHidden()
            }
        }
    }

    private var allergicReactionSection: some View {
        HStack {
            Text("Allergic reaction")
            Picker("Allergic reaction", selection: $viewModel.isAllergic) {
                Text("Yes").tag(true)
                Text("No").tag(false)
            }
            .pickerStyle(.segmented)
        }
    }

    private var notesAndPhotoSection: some View {
        VStack(alignment: .leading) {
            TextField("Notes", text: $viewModel.notes)

            PhotosPicker(
                selection: $viewModel.selectedPhotoItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                Group {
                    if let photoData = viewModel.selectedPhotoData,
                       let uiImage = UIImage(data: photoData)
                    {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.rose.rose50)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(Color.rose.rose700)
                            )
                    }
                }
                .frame(width: 100, height: 100)
                .overlay(alignment: .bottomTrailing) {
                    if viewModel.selectedPhotoData != nil {
                        Button {
                            viewModel.selectedPhotoItem = nil
                            viewModel.selectedPhotoData = nil
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundStyle(.rose500)
                        }
                    }
                }
            }
        }
    }

//    private var saveButton: some View {
//        Button(action: {
//            if viewModel.validateInputs() {
//                viewModel.updateMeal(context: context)
//            } else {
//                viewModel.showAlert = true
//            }
//        }) {
//            Text("Save")
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(viewModel.validateInputs() ? Color.rose.rose500 : Color.gray)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//        }
//        .disabled(!viewModel.validateInputs())
//    }
}

// #Preview {
//    RateMealView(meal: <#Meal#>)
// }
