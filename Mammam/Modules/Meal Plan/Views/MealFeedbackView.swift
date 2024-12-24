//
//  MealFeedbackView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftData
import SwiftUI

@Query var meals: [Meal]

struct MealFeedbackView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) var context
    @State private var navigateToHome = false

    var meal: Meal
    var fromRateMealView: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                HStack {
                    Text(meal.type)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text(formattedDate(meal.timeGiven))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Well Done Section
                VStack(spacing: 8) {
                    Text("Well done! 🎉")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Perfect timing! Consistent meal times help build a healthy routine")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Total Meal Time
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.black)
                    VStack(alignment: .leading) {
                        Text("Total Meal Time")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("\(meal.durationInMinutes) minutes")
                            .font(.title3)
                        Text("\(meal.timeRange)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Total Meal Consumption
                HStack {
                    Image(systemName: "fork.knife")
                        .foregroundColor(.black)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Total Meal Consumption")
                                .font(.callout)
                            Text("\(meal.totalConsumption)")
                                .font(.subheadline)
                        }
                        HStack(spacing: 4) {
                            ForEach(0 ..< Int(meal.servingQty), id: \.self) { index in
                                Image(
                                    systemName: index < Int(meal.consumedQty)
                                        ? filledIconForServingUnit(meal.servingUnit)
                                        : emptyIconForServingUnit(meal.servingUnit)
                                )
                                .foregroundColor(index < Int(meal.consumedQty) ? .black : .gray)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Allergy Feedback
                HStack(alignment: .top) {
                    Image(systemName: "star.fill")
                    Text(meal.isAllergic ? "huhu allergic reactions today — please take care!" : "No allergic reactions today — great job introducing new tastes!")
                        .font(.subheadline)

                    Spacer()
                }
                .padding()
                .foregroundColor(meal.isAllergic ? .red : .green)
                .background(meal.isAllergic ? Color.red.opacity(0.2) : Color.green.opacity(0.2))
                .cornerRadius(8)
                .padding(12)

                // Notes Section
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "doc.text")
                        Text("Notes")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 16) {
                        Image(meal.ingredient?.image ?? "leaf")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text(meal.notes)
                            .font(.body)
                    }
                }
                .padding(.horizontal)

                Spacer()

                // Back to Home Button

                Button(action: {
                    coordinator.dismissSheetAndNavigateToHome()
                }) {
                    Text("Back to Home")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.rose.rose500)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarBackButtonHidden(fromRateMealView)
        }
    }
}

private func iconForServingUnit(_ unit: String) -> String {
    switch unit.lowercased() {
    case "cup":
        return "cup.and.saucer"
    case "tsp":
        return "fork.knife.circle"
    case "tbsp":
        return "fork.knife"
    default:
        return "fork.knife.circle"
    }
}

private func filledIconForServingUnit(_ unit: String) -> String {
    switch unit.lowercased() {
    case "cup":
        return "cup.and.saucer.fill"
    case "tsp":
        return "fork.knife.circle.fill"
    case "tbsp":
        return "fork.knife.circle.fill"
    default:
        return "fork.knife.circle.fill"
    }
}

private func emptyIconForServingUnit(_ unit: String) -> String {
    switch unit.lowercased() {
    case "cup":
        return "cup.and.saucer"
    case "tsp":
        return "fork.knife.circle"
    case "tbsp":
        return "fork.knife.circle"
    default:
        return "fork.knife.circle"
    }
}

func formatTime(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm" // Use hour and minute only, in 24-hour format
    return formatter.string(from: date)
}

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM dd, yyyy" // Day of the week, full month name, day, and year
    return formatter.string(from: date)
}

private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, dd MMM"
    return formatter.string(from: date)
}

func formatBool(_ value: Bool) -> String {
    return value ? "Allergic" : "Not allergic" // Customize as needed
}

func calculateDuration(timeGiven: Date, timeEnded: Date) -> String {
    // Ensure that timeEnded is not earlier than timeGiven
    guard timeEnded >= timeGiven else {
        return "Invalid Time: End time is earlier than start time"
    }

    let duration = Calendar.current.dateComponents([.hour, .minute], from: timeGiven, to: timeEnded)

    // Safely unwrap the hours and minutes
    let hours = duration.hour ?? 0
    let minutes = duration.minute ?? 0

    // Return the formatted string
    if hours > 0 {
        return "\(hours) hour(s) and \(minutes) minute(s)"
    } else {
        return "\(minutes) minute(s)"
    }
}

#Preview {
    let sampleIngredient = Ingredient(name: "Egg", image: "egg")
    let sampleMeal = Meal(
        ingredient: sampleIngredient,
        type: "Breakfast",
        timeGiven: Date(),
        timeEnded: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date(),
        servingUnit: "Cup",
        servingQty: 6,
        consumedQty: 3.5,
        isAllergic: true,
        isLogged: true,
        notes: "Had a slight allergic reaction."
    )

    MealFeedbackView(meal: sampleMeal, fromRateMealView: false)
}
