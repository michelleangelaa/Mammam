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
    
    @StateObject private var viewModel = ProgressViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                headerSection
                periodPicker
                dateNavigationControls
                contentSection
            }
            .padding()
        }
        .scrollIndicators(.hidden)
//        .onAppear { updateViewModelData() }
        .onAppear {
            viewModel.currentDate = Calendar.current.startOfMonth(for: Date())
            updateViewModelData()
        }
        .onChange(of: meals) { _ in updateViewModelData() }
        .onChange(of: nutrients) { _ in updateViewModelData() }
    }
    
    // MARK: - View Components
    
    private var headerSection: some View {
        VStack(alignment: .leading) {
            Text(viewModel.period == 0 ? "Monthly Variation Summary" : "Weekly Variation Summary")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
    
    private var periodPicker: some View {
        Picker("Period", selection: $viewModel.period) {
            Text("Monthly").tag(0)
            Text("Weekly").tag(1)
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    private var dateNavigationControls: some View {
        HStack {
            Button(action: { viewModel.navigateDate(-1) }) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text(viewModel.displayPeriodTitle)
                .font(.headline)
            Spacer()
            Button(action: { viewModel.navigateDate(1) }) {
                Image(systemName: "chevron.right")
            }
        }
        .padding(.horizontal)
    }
    
    private var contentSection: some View {
        Group {
            if viewModel.filteredMeals.isEmpty {
                emptyStateView
            } else {
                VStack {
                    pieChartSection
                    mealHistorySections
                }
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text("Nothing was logged during this period")
                .font(.body)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var pieChartSection: some View {
        Chart(viewModel.filteredNutrients, id: \.name) { nutrient in
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
                        Text("\(viewModel.totalLoggedMealsCount) Logs")
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
            }
        }
        .frame(width: 324, height: 200)
        .padding()
    }
    
    private var mealHistorySections: some View {
        LazyVStack(alignment: .leading) {
            displayAllergicWatch(meals: viewModel.filteredMeals, coordinator: coordinator)
            displayLogHistory(meals: viewModel.filteredMeals,
                            period: viewModel.period,
                            coordinator: coordinator)
        }
    }
    
    // MARK: - Helper Methods
    
    private func updateViewModelData() {
        viewModel.meals = meals
        viewModel.nutrients = nutrients
    }
}

// MARK: - Subviews remain unchanged below this line
// [Keep the existing implementations of displayAllergicWatch, displayLogHistory,
//  HistoryMealCardView, and Calendar extensions here...]


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
