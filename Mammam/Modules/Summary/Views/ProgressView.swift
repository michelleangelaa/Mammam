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
    @Environment(\.modelContext) private var context
    @Query private var nutrients: [Nutrient]
    @Query private var meals: [Meal]
    @State private var period = 0

    var body: some View {
        VStack {
            Picker("Period", selection: $period) {
                Text("Monthly").tag(0)
                Text("Weekly").tag(1)
            }
            .pickerStyle(.segmented)

            VStack {
                Chart(nutrients, id: \.name) { nutrient in
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
                                Text("\(totalNutrientCount) Times")
                            }
                            .position(x: frame.midX, y: frame.midY)
                        }
                    }
                }
                .frame(width: 324, height: 275)
                .padding()
            }

            ScrollView {
                LazyVStack(alignment: .leading) {
                    displayAllergicWatch()
                    displayLogHistory()
                }
            }
        }
        .padding()
        .navigationTitle("Variation Summary")
    }
    private var totalNutrientCount: Int {
        return nutrients.reduce(0) { $0 + $1.nutrientCount }
    }
}



struct displayAllergicWatch: View {
    @Query private var meals: [Meal]

    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
            Text("Allergic Watch")
        }
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(meals.filter { $0.isLogged && $0.isAllergic }.sorted(by: { $0.timeGiven < $1.timeGiven }), id: \.self) { meal in
                    NavigationLink(destination: MealFeedbackView()) {
                        HistoryMealCardView(meal: meal)
                    }
                }
            }
        }
    }
}

struct displayLogHistory: View {
    @Query private var meals: [Meal]

    var body: some View {
        HStack {
            Image(systemName: "menucard")
            Text("Log History")
        }
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(meals.filter { $0.isLogged }.sorted(by: { $0.timeGiven < $1.timeGiven }), id: \.self) { meal in
                    NavigationLink(destination: MealFeedbackView()) {
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

#Preview {
    ProgressView()
}
