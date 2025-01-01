//
//  MealPlannerView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

//
//  MealPlannerView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftData
import SwiftUI

struct MealPlannerView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context

    @Query(sort: \MealPlan.startDate, order: .forward) private var plans: [MealPlan]

    var body: some View {
        if plans.isEmpty {
            emptyStateView
        } else {
            mealPlansScrollView
        }
    }

    private var emptyStateView: some View {
        VStack(alignment: .leading) {
            Text("Meal Planner")
                .font(.title2)
                .fontWeight(.bold)
            Label("No meal planner yet", systemImage: "doc.richtext.fill")
                .font(.headline)
                .padding()
            Text("No meal plans available. Create a new meal plan!")
                .foregroundColor(.gray)

            HStack {
                Button(action: {
                    coordinator.push(page: .createMealPlan) // Correct method for navigation
                }) {
                    HStack {
                        Label("Create your plan", systemImage: "lightbulb.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemGray6))
                    )
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }

    private func mealTypeOrder(_ type: String) -> Int {
        switch type {
        case "Breakfast": return 0
        case "Morning Snack": return 1
        case "Lunch": return 2
        case "Evening Snack": return 3
        case "Dinner": return 4
        default: return 5
        }
    }

    private var mealPlansScrollView: some View {
        VStack(alignment: .leading) {
            Text("Meal Planner")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            HStack {
                Button(action: {
                    coordinator.push(page: .createMealPlan) // Correct method for navigation
                }) {
                    HStack {
                        Label("Create your plan", systemImage: "lightbulb.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
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
                    let allMeals = plans.flatMap { $0.meals ?? [] }
                    let groupedMeals = Dictionary(grouping: allMeals) { meal in
                        Calendar.current.startOfDay(for: meal.timeGiven)
                    }
                    let sortedDates = groupedMeals.keys.sorted()

                    ForEach(sortedDates, id: \.self) { date in
                        if let mealsForDate = groupedMeals[date] {
                            // Filter for unlogged meals
                            let unloggedMeals = mealsForDate.filter { !$0.isLogged }
                            
                            // Only display the section if there are unlogged meals
                            if !unloggedMeals.isEmpty {
                                Section(header: Text(formattedDate(date))
                                    .font(.headline)
                                    .padding(.horizontal)
                                ) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        LazyHStack(spacing: 16) {
                                            ForEach(
                                                unloggedMeals
                                                    .sorted {
                                                        MealTypeOrderUtility.mealTypeOrder($0.type) < MealTypeOrderUtility.mealTypeOrder($1.type)
                                                    }
                                            ) { meal in
                                                Button(action: {
                                                    coordinator.presentRateMealSheet(with: meal)
                                                }) {
                                                    MealCardComponent(meal: meal)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.top)
    }

    func datesBetween(start: Date, end: Date) -> [Date] {
        var dates = [Date]()
        var currentDate = Calendar.current.startOfDay(for: start)
        let endDate = Calendar.current.startOfDay(for: end)

        while currentDate <= endDate {
            dates.append(currentDate)
            if let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) {
                currentDate = nextDate
            } else {
                break
            }
        }
        return dates
    }

    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, dd MMM"
    return formatter.string(from: date)
}

#Preview {
    MealPlannerView()
}
