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
        ScrollView {
            VStack(alignment: .leading) {
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

                if filteredMeals.isEmpty {
                    // Empty State View
                    VStack(spacing: 16) {
                        Image(systemName: "doc.text.magnifyingglass")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("Nothing was logged during this period")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    VStack {
                        // Pie Chart for Nutrients
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
                                        Text("\(totalLoggedMealsCount) Logs")
                                    }
                                    .position(x: frame.midX, y: frame.midY)
                                }
                            }
                        }
                        .frame(width: 324, height: 200)
                        .padding()
                    }

                    //                ScrollView {
                    LazyVStack(alignment: .leading) {
                        displayAllergicWatch(meals: filteredMeals, coordinator: coordinator)
                        displayLogHistory(meals: filteredMeals, period: period, coordinator: coordinator)
                    }
                    //                }
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Computed Properties

    private var percentageChange: Double {
        let previousCount = totalLoggedMealsCount(for: -1)
        let currentCount = totalLoggedMealsCount
        guard previousCount > 0 else { return 0 }
        return Double(currentCount - previousCount) / Double(previousCount) * 100
    }

    private var percentageChangeText: String {
        if percentageChange > 0 {
            return "+\(String(format: "%.1f", percentageChange))% from last \(period == 0 ? "month" : "week")"
        } else if percentageChange < 0 {
            return "\(String(format: "%.1f", percentageChange))% from last \(period == 0 ? "month" : "week")"
        } else {
            return "No change from last \(period == 0 ? "month" : "week")"
        }
    }

    private var totalLoggedMealsCount: Int {
        return filteredMeals.count
    }

    private func totalLoggedMealsCount(for offset: Int) -> Int {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: period == 0 ? .month : .weekOfYear, value: offset, to: currentDate) ?? currentDate
        let range = period == 0 ? calendar.dateInterval(of: .month, for: date) : calendar.dateInterval(of: .weekOfYear, for: date)

        return meals.filter {
            $0.isLogged &&
                ($0.timeGiven >= (range?.start ?? Date()) && $0.timeGiven <= (range?.end ?? Date()))
        }.count
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
                .font(.body)
        }
        .foregroundStyle(Color.red)

//        ScrollView {
        LazyVStack(spacing: 16) {
            ForEach(meals.filter { $0.isAllergic }.sorted(by: { $0.timeGiven < $1.timeGiven }), id: \.self) { meal in
                Button(action: {
                    coordinator.presentSheet(sheet: .mealFeedback(meal: meal))
                }) {
                    HistoryMealCardView(meal: meal)
                }
            }
//            }
        }
    }
}

struct displayLogHistory: View {
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
                if period == 0 && meals.count > 2 * 5 {
                    NavigationLink("View All") {
                        LogHistoryView(meals: meals)
                    }
                }
            }
            .padding(.top, 20)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(groupMealsByDate(), id: \.key) { date, dailyMeals in
                        VStack(alignment: .leading, spacing: 8) {
                            // Date Header
                            Text(formattedDate(date))
                                .font(.headline)
                                .padding(.horizontal)

                            // Meals for the Date
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
    }

    // Helper function to group meals by date
    private func groupMealsByDate() -> [(key: Date, value: [Meal])] {
        let calendar = Calendar.current
        let groupedMeals = Dictionary(grouping: meals.sorted(by: { $0.timeGiven < $1.timeGiven })) { meal in
            calendar.startOfDay(for: meal.timeGiven)
        }
        return groupedMeals.sorted { $0.key < $1.key }
    }

    // Helper function to format date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct HistoryMealCardView: View {
    var meal: Meal

    var body: some View {
        HStack(spacing: 16) {
            Image(meal.ingredient?.image ?? "fork.knife")
                .resizable()
                .frame(width: 70, height: 70)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                
                Text(meal.type)
                    .font(.footnote)
                    .foregroundStyle(Color.gray.gray700)
                
                Text(meal.ingredient?.name ?? "Unknown")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 6)

                HStack {
                    Image(systemName: "clock.fill")
                    Text("\(meal.durationInMinutes) min")
                    Text("・")
                    Image(
                        filledIconForServingUnit(meal.servingUnit)
                    )
                    .resizable()
                    .frame(width: 12, height: 12)
                    Text("\(String(format: "%.1f", meal.consumedQty))/\(String(format: "%.1f", meal.servingQty))")
                }
                .font(.caption2)
                .foregroundStyle(Color.black)
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

private func filledIconForServingUnit(_ unit: String) -> String {
    switch unit.lowercased() {
    case "cup":
        return "i_logmealform_cup2"
    case "tsp":
        return "i_logmealform_spoon"
    case "tbsp":
        return "i_logmealform_spoon"
    default:
        return "i_logmealform_spoon"
    }
}


#Preview {
    ProgressView()
}
