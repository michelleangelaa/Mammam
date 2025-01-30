//
//  MealPlannerView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftData
import SwiftUI

struct MealPlannerView: View {
    @StateObject var viewModel: MealPlannerViewModel
    @EnvironmentObject private var coordinator: Coordinator
    @Query(sort: \MealPlan.startDate, order: .forward) private var plans: [MealPlan]

    init() {
        _viewModel = StateObject(wrappedValue: MealPlannerViewModel())
    }

    var body: some View {
        ZStack {
            Image("BG_Home")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            if viewModel.groupedMealsByDate.isEmpty {
                emptyStateView
            } else {
                mealPlansScrollView
            }
        }
        .onChange(of: plans) { newPlans in
            viewModel.updatePlans(newPlans)
        }
        .onAppear {
            viewModel.updatePlans(plans)
        }
    }

    private var emptyStateView: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Meal Planner")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Prepare meal ingredient variations")
                    .font(.callout)

                Button(action: {
                    coordinator.push(page: .createMealPlan)
                }) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Label("Start your meal plan today!", systemImage: "lightbulb.fill")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                Text("Introduce a variety of new foods with ease")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                            }
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemGray6))
                    )
                }
            }

            Spacer()
            VStack(alignment: .center, spacing: 12) {
                Image(systemName: "list.clipboard")
                    .font(.system(size: 50))
                Text("No meal plans available.\nCreate a new meal plan!")
                    .font(.body)
            }
            .foregroundColor(.gray500)

            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 80)
        .padding(.bottom, 70)
    }

    private var mealPlansScrollView: some View {
        VStack(alignment: .leading) {
            Text("Meal Planner")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            HStack {
                Button(action: {
                    coordinator.push(page: .createMealPlan)
                }) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Label("Create your plan!", systemImage: "lightbulb.fill")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                Text("Introduce a variety of new foods with ease")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                            }
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemGray6))
                    )
                }
            }
            .padding(.horizontal)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.groupedMealsByDate, id: \.date) { group in
                        let date = group.date
                        let mealsForDate = group.meals
                        let unloggedMeals = mealsForDate.filter { !$0.isLogged }

                        VStack(alignment: .leading, spacing: 8) {
                            if !unloggedMeals.isEmpty {
                                Section(header: Text(viewModel.formattedDate(date))
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                ) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        LazyHStack(spacing: 16) {
                                            ForEach(
                                                unloggedMeals.sorted {
                                                    viewModel.mealTypeOrder($0.type) < viewModel.mealTypeOrder($1.type)
                                                }
                                            ) { meal in
                                                Button(action: {
                                                    coordinator.presentMealDetailSheet(with: meal)
                                                }) {
                                                    MealCardComponent(meal: meal)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.leading)
                        .padding(.bottom, 12)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.top, 80)
        .padding(.bottom, 70)
    }
}
