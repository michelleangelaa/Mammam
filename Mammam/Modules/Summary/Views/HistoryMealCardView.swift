//
//  HistoryMealCardView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 17/02/25.
//

import SwiftUI

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
                    .foregroundColor(.gray)

                Text(meal.ingredient?.name ?? "Unknown")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.bottom, 6)

                HStack {
                    Image(systemName: "clock.fill")
                    Text("\(meal.durationInMinutes) min")
                    Text("・")
                    Image(filledIconForServingUnit(meal.servingUnit))
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text("\(String(format: "%.1f", meal.consumedQty))/\(String(format: "%.1f", meal.servingQty))")
                }
                .font(.caption2)
                .foregroundColor(.black)
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
