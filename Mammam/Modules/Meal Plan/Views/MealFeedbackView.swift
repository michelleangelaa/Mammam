//
//  MealFeedbackView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import PhotosUI
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
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    Spacer()
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
                        Text(feedbackMessage(for: meal))
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)

                    // Total Meal Time
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.black)
                                Text("Total meal time")
                                    .font(.callout)
                            }
                            Text("\(meal.durationInMinutes) minutes")
                                .font(.callout)
                                .fontWeight(.bold)

                            Text("\(meal.timeRange)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "fork.knife")
                                    .foregroundColor(.black)
                                HStack {
                                    Text("Total Meal Consumption")
                                        .font(.callout)
                                    Text("\(meal.totalConsumption)")
                                        .font(.subheadline)
                                }
                            }
//                            VStack {
                            LazyVGrid(
                                columns: Array(repeating: GridItem(.fixed(20), spacing: 4), count: 15),
                                spacing: 8
                            ) {
                                ForEach(0 ..< Int(meal.servingQty), id: \.self) { index in
                                    Image(
                                        index < Int(meal.consumedQty)
                                            ? filledIconForServingUnit(meal.servingUnit)
                                            : emptyIconForServingUnit(meal.servingUnit)
                                    )
                                }
                            }
//                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Allergy Feedback
                HStack(alignment: .top) {
                    Image(systemName: meal.isAllergic ? "exclamationmark.triangle.fill" : "star.fill")
                    Text(meal.isAllergic ? "There is a reaction to \(meal.ingredient?.name ?? "this ingredient"). Let’s explore safer options next time." : "No allergic reactions today — great job introducing new tastes!")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)

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
                        Image(systemName: "list.clipboard.fill")
                            .foregroundColor(.black)
                        Text("Notes")
                            .font(.subheadline)
                    }
                    HStack(spacing: 16) {
                        if let photoData = meal.photo, let uiImage = UIImage(data: photoData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64) // Match the example image dimensions
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(UIColor.systemGray5))
                                .frame(width: 64, height: 64)
                                .overlay(
                                    Text("No Image")
                                        .foregroundColor(.secondary)
                                        .font(.caption)
                                )
                        }

                        Text(meal.notes)
                            .font(.body)
                            .foregroundColor(.black)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)

                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(12)
                }
                .padding(.horizontal)


                VStack {
                    // Back to Home Button
                    if fromRateMealView {
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
                        .padding(.top, 20)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden(fromRateMealView)
    }
}

private func iconForServingUnit(_ unit: String) -> String {
    switch unit.lowercased() {
    case "cup":
        return "i_logmealform_notfilledcup2"
    case "tsp":
        return "i_logmealform_notfilledspoon"
    case "tbsp":
        return "i_logmealform_notfilledspoon"
    default:
        return "i_logmealform_notfilledspoon"
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

private func emptyIconForServingUnit(_ unit: String) -> String {
    switch unit.lowercased() {
    case "cup":
        return "i_logmealform_notfilledcup2"
    case "tsp":
        return "i_logmealform_notfilledspoon"
    case "tbsp":
        return "i_logmealform_notfilledspoon"
    default:
        return "i_logmealform_notfilledspoon"
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

private func feedbackMessage(for meal: Meal) -> String {
    if meal.consumedQty >= meal.servingQty - 1.0 {
        return "Even a little progress counts. New foods take time to become favorites."
    } else {
        return "Don’t worry, mom! It’s all part of the journey. Keep trying—your patience is building their love for food."
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
