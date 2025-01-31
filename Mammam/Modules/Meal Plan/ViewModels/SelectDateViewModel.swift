////
////  SelectDateViewModel.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 30/01/25.
////
//
//// SelectDateViewModel.swift
//import SwiftUI
//import SwiftData
//
//@MainActor
//class SelectDateViewModel: ObservableObject {
//    @Published var startDate: Date = .init()
//    @Published var endDate: Date = .init()
//    @Published var showAlert: Bool = false
//    @Published var alertMessage: String = ""
//    
//    private var createdMealPlan: MealPlan?
//    private let context: ModelContext
//    
//    init(context: ModelContext) {
//        self.context = context
//        setupDefaultDates()
//    }
//    
//    func setupDefaultDates() {
//        let fetchDescriptor = FetchDescriptor<MealPlan>(sortBy: [SortDescriptor(\.endDate, order: .reverse)])
//        if let lastMealPlan = try? context.fetch(fetchDescriptor).first {
//            startDate = Calendar.current.date(byAdding: .day, value: 1, to: lastMealPlan.endDate) ?? .init()
//        } else {
//            startDate = Calendar.current.startOfDay(for: Date())
//        }
//        endDate = Calendar.current.date(byAdding: .day, value: 6, to: startDate) ?? .init()
//    }
//    
//    func validateDates() -> Bool {
//        if startDate > endDate {
//            alertMessage = "The start date cannot be later than the end date. Please adjust the dates."
//            return false
//        }
//
//        let fetchDescriptor = FetchDescriptor<MealPlan>()
//        let existingMealPlans = (try? context.fetch(fetchDescriptor)) ?? []
//
//        for plan in existingMealPlans {
//            if datesOverlap(start1: startDate, end1: endDate, start2: plan.startDate, end2: plan.endDate) {
//                alertMessage = "Selected dates overlap with an existing meal plan. Please choose a start date after \(dateString(from: plan.endDate))."
//                return false
//            }
//        }
//        return true
//    }
//    
//    func createMealPlan() -> MealPlan? {
//        guard createdMealPlan == nil else { return createdMealPlan }
//        
//        let fetchRequest = FetchDescriptor<User>()
//        guard let currentUser = try? context.fetch(fetchRequest).first,
//              let baby = currentUser.baby else {
//            print("No user or baby found")
//            return nil
//        }
//        
//        let newMealPlan = MealPlan(startDate: startDate, endDate: endDate, baby: baby)
//        context.insert(newMealPlan)
//        
//        if baby.mealPlans == nil {
//            baby.mealPlans = []
//        }
//        baby.mealPlans?.append(newMealPlan)
//        
//        generateMeals(for: newMealPlan)
//        
//        do {
//            try context.save()
//        } catch {
//            print("Failed to save context: \(error)")
//        }
//        
//        createdMealPlan = newMealPlan
//        return newMealPlan
//    }
//    
//    private func generateMeals(for mealPlan: MealPlan) {
//        let ingredientsFetchDescriptor = FetchDescriptor<Ingredient>()
//        let existingIngredients: [Ingredient]
//        do {
//            existingIngredients = try context.fetch(ingredientsFetchDescriptor)
//        } catch {
//            print("Failed to fetch ingredients: \(error)")
//            return
//        }
//
//        guard !existingIngredients.isEmpty else {
//            print("No existing ingredients found in database")
//            return
//        }
//
//        let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
//        let calendar = Calendar.current
//
//        let numberOfDays = calendar.dateComponents([.day], from: calendar.startOfDay(for: mealPlan.startDate),
//                                                   to: calendar.startOfDay(for: mealPlan.endDate)).day ?? 0
//        let totalDays = numberOfDays + 1
//
//        if mealPlan.meals == nil {
//            mealPlan.meals = []
//        }
//
//        for dayOffset in 0 ..< totalDays {
//            guard let currentDate = calendar.date(bySettingHour: 12, minute: 0, second: 0, of:
//                calendar.date(byAdding: .day, value: dayOffset, to: calendar.startOfDay(for: mealPlan.startDate))!)
//            else { continue }
//
//            for mealType in mealTypes {
//                let mealHour: Int
//                switch mealType {
//                case "Breakfast": mealHour = 8
//                case "Morning Snack": mealHour = 10
//                case "Lunch": mealHour = 12
//                case "Evening Snack": mealHour = 15
//                case "Dinner": mealHour = 18
//                default: mealHour = 12
//                }
//
//                guard let mealTime = calendar.date(bySettingHour: mealHour, minute: 0, second: 0, of: currentDate),
//                      let timeEnded = calendar.date(byAdding: .hour, value: 1, to: mealTime)
//                else { continue }
//
//                let randomIngredient = existingIngredients.randomElement()!
//
//                let meal = Meal(
//                    ingredient: randomIngredient,
//                    mealPlan: mealPlan,
//                    type: mealType,
//                    timeGiven: mealTime,
//                    timeEnded: timeEnded,
//                    servingUnit: "Cup",
//                    servingQty: 3,
//                    consumedQty: 0,
//                    isAllergic: false,
//                    isLogged: false,
//                    notes: ""
//                )
//
//                context.insert(meal)
//                mealPlan.meals?.append(meal)
//            }
//        }
//    }
//    
//    private func datesOverlap(start1: Date, end1: Date, start2: Date, end2: Date) -> Bool {
//        return !(end1 < start2 || start1 > end2)
//    }
//    
//    func dateString(from date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM dd"
//        return formatter.string(from: date)
//    }
//    
//    func dayString(from date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE"
//        return formatter.string(from: date)
//    }
//}
