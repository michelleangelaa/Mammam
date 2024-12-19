//
//  MealFeedbackView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftUI
import SwiftData

struct MealFeedbackView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) var context
    
    // Use @Query to fetch all meals from the model context
    @Query private var meals: [Meal]


    var body: some View {
        NavigationStack {
            VStack {
                Text("This is your meal feedback")
                    .font(.title2)
                    .padding()
                
                List {
                    ForEach(meals) { meal in
                        MealCell(meal: meal)
                    }
                }
            }
            .onAppear(perform: addSample) // Optional, to add dummy data
        }
    }
    
    func addSample() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        guard let timeGiven = dateFormatter.date(from: "2024/12/06 10:30"),
              let timeEnded = dateFormatter.date(from: "2024/12/06 10:35") else {
            print("Error creating dates")
            return
        }
        
        let dummyIngredient = Ingredient(name: "tofu")

        
        let meal1 = Meal(ingredient: dummyIngredient, type: "Morning Snack", timeGiven: timeGiven, timeEnded: timeEnded, servingUnit: "Table Spoon", servingQty: 2, consumedQty: 1, isAllergic: true, isLogged: true, notes: "gatal")
        context.insert(meal1)
    }
}

struct MealCell: View {
    let meal: Meal
//    let ingredient: Ingredient

//    let durationString = calculateDuration(timeGiven: meal.timeGiven, timeEnded: meal.timeEnded)

    var body: some View {
        HStack {
            Text(formatDate(meal.timeGiven))
            Spacer()
//            Text(meal.ingredient)
            Spacer()
            Text(calculateDuration(timeGiven: meal.timeGiven, timeEnded: meal.timeEnded))
            Spacer()
            Text("\(meal.servingQty) \(meal.servingUnit)")
            Spacer()
            Text(formatBool(meal.isAllergic))
            Spacer()
            Text(meal.notes)
        }
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
    MealFeedbackView()
}


#Preview {
    MealFeedbackView()
}
