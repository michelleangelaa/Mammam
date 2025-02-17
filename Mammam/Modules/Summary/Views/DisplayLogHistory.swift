//
//  DisplayLogHistory.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 17/02/25.
//

import SwiftUI

struct DisplayLogHistory: View {
    var meals: [Meal]
    var period: Int
    var coordinator: Coordinator

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "menucard")
                Text("Log History")
                    .font(.body)
                Spacer()
                if period == 0 && meals.count > 10 {
                    NavigationLink("View All") {
                        LogHistoryView(meals: meals)
                    }
                }
            }
            .padding(.top, 20)

            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(groupMealsByDate(), id: \.key) { date, dailyMeals in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(formattedDate(date))
                            .font(.headline)
                            .padding(.horizontal)

                        ForEach(dailyMeals, id: \.self) { meal in
                            Button(action: {
                                coordinator.presentSheet(sheet: .mealFeedback(meal: meal))
                            }) {
                                HistoryMealCardView(meal: meal)
                            }
                        }
                    }
                }
            }
        }
    }

    private func groupMealsByDate() -> [(key: Date, value: [Meal])] {
        let calendar = Calendar.current
        let groupedMeals = Dictionary(grouping: meals.sorted(by: { $0.timeGiven < $1.timeGiven })) { meal in
            calendar.startOfDay(for: meal.timeGiven)
        }
        return groupedMeals.sorted { $0.key < $1.key }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
