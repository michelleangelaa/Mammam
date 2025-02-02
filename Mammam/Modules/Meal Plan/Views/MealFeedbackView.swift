//
//  MealFeedbackView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import PhotosUI
import SwiftData
import SwiftUI

@Query var meals: [Meal]

struct MealFeedbackView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel: MealFeedbackViewModel
    var fromRateMealView: Bool

    init(meal: Meal, fromRateMealView: Bool = false) {
        _viewModel = StateObject(wrappedValue: MealFeedbackViewModel(meal: meal))
        self.fromRateMealView = fromRateMealView
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    Spacer()

                    // Meal Header
                    HStack {
                        Text(viewModel.mealType)
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        Text(viewModel.mealDate)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)

                    // Well Done Section
                    VStack(spacing: 8) {
                        Text("Well done! 🎉")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(viewModel.feedbackMessage)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)

                    // Meal Time and Consumption
                    VStack(alignment: .leading, spacing: 24) {
                        // Meal Time
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.black)
                                Text("Total meal time")
                                    .font(.callout)
                            }
                            Text(viewModel.totalMealTime)
                                .font(.callout)
                                .fontWeight(.bold)
                            Text(viewModel.timeRange)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }

                        // Consumption Icons
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "fork.knife")
                                    .foregroundColor(.black)
                                Text("Total Meal Consumption")
                                    .font(.callout)
                                Text("\(viewModel.meal.totalConsumption)")
                                    .font(.subheadline)
                            }
                            LazyVGrid(columns: Array(repeating: GridItem(.fixed(20), spacing: 4), count: 15), spacing: 8) {
                                ForEach(viewModel.consumptionIcons, id: \.id) { icon in
                                    Image(viewModel.iconForType(icon.type))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Allergy Feedback
                    HStack(alignment: .top) {
                        Image(systemName: viewModel.meal.isAllergic ? "exclamationmark.triangle.fill" : "star.fill")
                        Text(viewModel.allergyMessage)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)

                        Spacer()
                    }
                    .padding()
                    .foregroundColor(viewModel.allergyColor)
                    .background(viewModel.allergyBackgroundColor)
                    .cornerRadius(8)
                    .padding(12)

                    // Notes Section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "list.clipboard.fill")
                                .foregroundColor(.black)
                            Text("Notes")
                                .font(.subheadline)
                        }
                        HStack(spacing: 16) {
                            if let photo = viewModel.photo {
                                Image(uiImage: photo)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            Text(viewModel.notes)
                                .font(.body)
                                .foregroundColor(.black)
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)

                            Spacer()
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)

                    // Back to Home Button
                    if fromRateMealView {
                        Button(action: {
                            coordinator.dismissSheetAndNavigateToHome()
                        }) {
                            Text("Back to Home")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.rose.rose500)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden(fromRateMealView)
    }
}


#Preview {
    let sampleIngredient = Ingredient(name: "Egg", image: "egg")
    let sampleMeal = Meal(
        ingredient: sampleIngredient,
        type: "Breakfast",
        timeGiven: Date(),
        timeEnded: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
        servingUnit: "Cup",
        servingQty: 6,
        consumedQty: 3.5,
        isAllergic: true,
        isLogged: true,
        notes: "Had a slight allergic reaction."
    )

    MealFeedbackView(meal: sampleMeal, fromRateMealView: false)
}
