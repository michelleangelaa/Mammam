//
//  ReviewMealTypeView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 19/12/24.
//

import SwiftData
import SwiftUI

struct ReviewMealTypeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel: ReviewMealTypeViewModel

    init(mealPlan: MealPlan) {
        _viewModel = StateObject(wrappedValue: ReviewMealTypeViewModel(mealPlan: mealPlan))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            indicatorbar(totalCount: viewModel.progressIndicator.total, currentIndex: viewModel.progressIndicator.current)
            
            headerSection

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.meals.sorted(by: { $0.timeGiven < $1.timeGiven }), id: \.self) { meal in
                        ReviewMealCardView(meal: meal, dayRange: formattedDate(meal.timeGiven)) { updatedIngredient in
                            viewModel.updateMealIngredient(meal, newIngredient: updatedIngredient)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()

            CustomLargeButtonComponent(state: .enabled, text: viewModel.isLastMealType ? "Save" : "Next") {
                viewModel.nextStep(coordinator: coordinator)
            }
            .padding(.horizontal)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewModel.loadMealsForCurrentMealType()
            }
        }
        .onChange(of: viewModel.currentMealTypeIndex) { _ in
            viewModel.loadMealsForCurrentMealType()
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Review \(viewModel.currentMealType)")
                .font(.title2)
                .fontWeight(.bold)
            Text("Healthy \(viewModel.currentMealType.lowercased()) with nutrition")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd"
    return formatter.string(from: date)
}
