//
//  LogHistoryView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 24/12/24.
//

import SwiftData
import SwiftUI

struct LogHistoryView: View {
    @Environment(\.dismiss) private var dismiss
    var meals: [Meal]

    @State private var currentDate = Date()

    var groupedMeals: [String: [Meal]] {
        Dictionary(grouping: meals, by: { meal in
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd MMM"
            return formatter.string(from: meal.timeGiven)
        }).sorted { lhs, rhs in
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd MMM"
            guard let lhsDate = formatter.date(from: lhs.key), let rhsDate = formatter.date(from: rhs.key) else {
                return false
            }
            return lhsDate > rhsDate
        }.reduce(into: [String: [Meal]]()) { $0[$1.key] = $1.value }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Navigation Header
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("\(formattedMonth(currentDate)) Log History")
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)

                // Meal List
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(groupedMeals.keys.sorted(by: { $0 > $1 }), id: \.self) { date in
                            Section(header: Text(date).font(.headline).padding(.leading)) {
                                ForEach(groupedMeals[date] ?? [], id: \.self) { meal in
                                    HistoryMealCardView(meal: meal)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    // Helper Functions
    private func formattedMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: date)
    }

    private func weekTitle(_ date: Date) -> String {
        let calendar = Calendar.current
        let startOfWeek = calendar.startOfWeek(for: date)
        let weekNumber = calendar.component(.weekOfMonth, from: startOfWeek)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        let month = formatter.string(from: startOfWeek)
        return "\(month), Week \(weekNumber)"
    }

    private func navigateWeek(_ step: Int) {
        let calendar = Calendar.current
        currentDate = calendar.date(byAdding: .weekOfYear, value: step, to: currentDate) ?? currentDate
    }
}



//#Preview {
//    LogHistoryView()
//}
