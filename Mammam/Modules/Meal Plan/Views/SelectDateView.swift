//
//  SelectDateView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 19/12/24.
//


import SwiftData
import SwiftUI

struct SelectDateView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = SelectDateViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            indicatorbar(totalCount: 5, currentIndex: 1)
            
            VStack(alignment: .leading) {
                Text("Select Date")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Create your weekly meal plan!🤩")
                    .font(.footnote)
            }
            .padding(.horizontal)
            
            HStack {
                VStack(spacing: 4) {
                    Text(viewModel.dayString(from: viewModel.startDate))
                        .font(.headline)
                    DatePicker("", selection: $viewModel.startDate, displayedComponents: .date)
                        .labelsHidden()
                        .fixedSize()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text("to")
                
                VStack(spacing: 4) {
                    Text(viewModel.dayString(from: viewModel.endDate))
                        .font(.headline)
                    DatePicker("", selection: $viewModel.endDate, displayedComponents: .date)
                        .labelsHidden()
                        .fixedSize()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            
            Spacer()
            
            CustomLargeButtonComponent(state: .enabled, text: "Next") {
                guard viewModel.createdMealPlan == nil else { return }
                
                if viewModel.validateDates(context: context) {
                    viewModel.createMealPlan(context: context)
                    if let mealPlan = viewModel.createdMealPlan {
                        coordinator.push(page: .reviewMealType(mealPlan: mealPlan))
                    }
                } else {
                    viewModel.showAlert = true
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            viewModel.setupDefaultDates(context: context)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Invalid Dates"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    @ViewBuilder
    private func indicatorbar(totalCount: Int, currentIndex: Int) -> some View {
        HStack(spacing: 8) {
            ForEach(0..<totalCount, id: \.self) { index in
                Rectangle()
                    .fill(index < currentIndex ? Color.rose500 : Color.gray.opacity(0.3))
                    .frame(height: 4)
                    .cornerRadius(2)
            }
        }
        .padding(.horizontal)
    }
}
