//
//  ProgressView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import Charts
import SwiftData
import SwiftUI

struct ProgressView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Query private var nutrients: [Nutrient]
    @Query private var meals: [Meal]
    @State private var period = 0 // 0: Monthly, 1: Weekly
    @State private var currentDate = Date() // Tracks the current date for week/month navigation

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(period == 0 ? "Monthly Variation Summary" : "Weekly Variation Summary")
                    .font(.title2)
                    .fontWeight(.bold)
            }

            Picker("Period", selection: $period) {
                Text("Monthly").tag(0)
                Text("Weekly").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()

            HStack {
                Button(action: { navigateDate(-1) }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(displayPeriodTitle)
                    .font(.headline)
                Spacer()
                Button(action: { navigateDate(1) }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)

            VStack {
                Chart(filteredNutrients, id: \.name) { nutrient in
                    SectorMark(
                        angle: .value("Count", nutrient.nutrientCount),
                        innerRadius: .ratio(0.618),
                        angularInset: 1.5
                    )
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Nutrient", nutrient.name))
                }
                .chartLegend(position: .automatic).padding(.vertical)
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        if let frame = chartProxy.plotFrame.map({ geometry[$0] }) {
                            VStack {
                                Text("TOTAL")
                                Text("\(totalLoggedMealsCount) Meals")
                            }
                            .position(x: frame.midX, y: frame.midY)
                        }
                    }
                }
                .frame(width: 324, height: 200)
                .padding()
            }

            ScrollView {
                LazyVStack(alignment: .leading) {
                    displayAllergicWatch(meals: filteredMeals, coordinator: coordinator)
                    displayLogHistory(meals: filteredMeals, period: period, coordinator: coordinator)
                }
            }
        }
        .padding()
    }

    private var totalFilteredNutrientCount: Int {
        return filteredNutrients.reduce(0) { $0 + $1.nutrientCount }
    }
    
    private var totalLoggedMealsCount: Int {
        return filteredMeals.count
    }


    private var filteredMeals: [Meal] {
        let calendar = Calendar.current

        if period == 1 { // Weekly
            let weekRange = calendar.dateInterval(of: .weekOfYear, for: currentDate)
            return meals.filter {
                $0.isLogged &&
                    ($0.timeGiven >= (weekRange?.start ?? Date()) && $0.timeGiven <= (weekRange?.end ?? Date()))
            }
        } else { // Monthly
            let monthRange = calendar.dateInterval(of: .month, for: currentDate)
            return meals.filter {
                $0.isLogged &&
                    ($0.timeGiven >= (monthRange?.start ?? Date()) && $0.timeGiven <= (monthRange?.end ?? Date()))
            }
        }
    }

    private var filteredNutrients: [Nutrient] {
        var nutrientCounts = [String: Int]()
        for meal in filteredMeals {
            meal.ingredient?.nutrients?.forEach { nutrient in
                nutrientCounts[nutrient.name, default: 0] += 1
            }
        }
        return nutrientCounts.map { Nutrient(name: $0.key, nutrientCount: $0.value) }
    }

    private func navigateDate(_ step: Int) {
        let calendar = Calendar.current
        if period == 1 {
            currentDate = calendar.date(byAdding: .weekOfYear, value: step, to: currentDate) ?? currentDate
        } else {
            currentDate = calendar.date(byAdding: .month, value: step, to: currentDate) ?? currentDate
        }
    }

    private var displayPeriodTitle: String {
        let calendar = Calendar.current

        if period == 0 { // Monthly
            return displayMonths()
        } else { // Weekly
            return displayWeeks()
        }
    }

    private func displayMonths() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"

        let startMonth = formatter.string(from: Calendar.current.startOfMonth(for: currentDate))
        let endMonth = formatter.string(from: Calendar.current.endOfMonth(for: currentDate))

        // Avoid displaying duplicate months
        if startMonth == endMonth {
            return startMonth
        } else {
            return "\(startMonth), \(endMonth)"
        }
    }

    private func displayWeeks() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"

        let startOfWeek = Calendar.current.startOfWeek(for: currentDate)
        let endOfWeek = Calendar.current.endOfWeek(for: currentDate)

        let startMonth = formatter.string(from: startOfWeek)
        let endMonth = formatter.string(from: endOfWeek)
        let weekOfYear = Calendar.current.component(.weekOfYear, from: startOfWeek)

        if startMonth == endMonth {
            // If the weeks are within the same month, display normally
            return "\(startMonth), Week \(weekOfYear)"
        } else {
            // If the weeks span two different months, display both months
            return "\(startMonth) - \(endMonth), Week \(weekOfYear)"
        }
    }

}

struct displayAllergicWatch: View {
    var meals: [Meal]
    var coordinator: Coordinator

    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
            Text("Allergic Watch")
        }
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(meals.filter { $0.isAllergic }.sorted(by: { $0.timeGiven < $1.timeGiven }), id: \.self) { meal in
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

struct displayLogHistory: View {
    var meals: [Meal]
    var period: Int
    var coordinator: Coordinator

    var body: some View {
        HStack {
            Image(systemName: "menucard")
            Text("Log History")
            if period == 0 && meals.count > 2 * 7 * 5 {
                Text("View all")
                NavigationLink("View All") {
                    LogHistoryView(meals: meals)
                }
            }
        }
        ScrollView {
            LazyVStack(spacing: 16) {
                let displayedMeals = period == 0 ? Array(meals.prefix(2 * 7 * 5)) : meals // Limit to 2 weeks if monthly
                ForEach(displayedMeals.sorted(by: { $0.timeGiven < $1.timeGiven }), id: \.self) { meal in
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

struct HistoryMealCardView: View {
    var meal: Meal

    var body: some View {
        HStack(spacing: 16) {
            Image(meal.ingredient?.image ?? "leaf")
                .resizable()
                .frame(width: 70, height: 70)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(meal.ingredient?.name ?? "Unknown")
                    .font(.headline)

                HStack {
                    Text(meal.type)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("・")
                    Text("\(meal.durationInMinutes) minutes")
                    Text("・")
                    Text("\(meal.consumedQty)/\(meal.servingQty) " + meal.servingUnit)
                }
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray6))
        )
    }
}

extension Calendar {
    func startOfMonth(for date: Date) -> Date {
        return self.date(from: dateComponents([.year, .month], from: date))!
    }

    func endOfMonth(for date: Date) -> Date {
        let startOfMonth = self.startOfMonth(for: date)
        return self.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
    }

    func startOfWeek(for date: Date) -> Date {
        let components = dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return self.date(from: components)!
    }

    func endOfWeek(for date: Date) -> Date {
        let startOfWeek = self.startOfWeek(for: date)
        return self.date(byAdding: .day, value: 6, to: startOfWeek)!
    }
}

#Preview {
    ProgressView()
}
