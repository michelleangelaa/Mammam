//
//  MealCardComponent.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 25/12/24.
//

import SwiftUI

struct MealCardComponent: View {
    var meal: Meal

    var body: some View {
        VStack(spacing: 10) {
            if let ingredient = meal.ingredient {
                Image(ingredient.image ?? "fork.knife")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .cornerRadius(8)
            } else {
                Color.gray
                    .frame(width: 70, height: 70)
                    .cornerRadius(8)
            }

            Text(meal.type)
                .font(.subheadline)
                .bold()

            Text(formattedDate(meal.timeGiven))
                .font(.caption)

            Text(meal.ingredient?.name ?? "No ingredient")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(width: 120)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(meal.isLogged ? Color(UIColor.systemGreen) : Color(UIColor.systemGray6))
        )
    }
}

private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, dd MMM"
    return formatter.string(from: date)
}

// MARK: - Sample Data for Preview
extension Meal {
    static var sampleMeal: Meal {
        Meal(
            ingredient: Ingredient(name: "Chicken", image: "chicken_image"),
            type: "Lunch",
            timeGiven: Date(),
            timeEnded: Date().addingTimeInterval(3600),
            servingUnit: "grams",
            servingQty: 250,
            consumedQty: 200,
            isAllergic: false,
            isLogged: true,
            notes: "Tasty meal with fresh chicken."
        )
    }
}

extension Ingredient {
    static var sampleIngredient: Ingredient {
        Ingredient(name: "Chicken", image: "chicken_image")
    }
}

// MARK: - Preview
#Preview {
    MealCardComponent(meal: Meal.sampleMeal)
}
