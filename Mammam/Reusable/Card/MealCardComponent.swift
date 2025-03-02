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
                    .frame(width: 88, height: 88)
                    .cornerRadius(8)
            } else {
                Color.gray
                    .frame(width: 70, height: 70)
                    .cornerRadius(8)
            }

            VStack (alignment: .leading, spacing: 4) {
                HStack {
                    Text(meal.type)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "pencil")
                        .font(.footnote)
                        .foregroundColor(.black)
                }

                Text(meal.ingredient?.name ?? "No ingredient")
                    .font(.caption2)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            
        }
        .frame(width: 148, height: 156)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.bluegray.bluegray50)
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
