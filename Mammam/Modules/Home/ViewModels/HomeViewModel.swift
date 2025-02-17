////
////  HomeViewModel.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 17/02/25.
////
//
//import SwiftData
//import SwiftUI
//
//class HomeViewModel: ObservableObject {
//    @Published var todayMealPlan: MealPlan?
//    @Published var nextUnloggedMeal: Meal?
//    @Published var savedMenuCount: Int = 0
//    @Published var todayMotivation: Motivation?
//    @Published var todayArticle: Article?
//    @Published var babyProfile: Baby?
//    
//    private let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]
//    
//    @Query private var privateMenus: [FoodMenu]
//    @Query private var motivations: [Motivation]
//    @Query private var babies: [Baby]
//    @Query private var articles: [Article]
//    @Query(sort: \MealPlan.startDate, order: .forward) private var plans: [MealPlan]
//
//    init() {
//        fetchData()
//    }
//    
//    func fetchData() {
//        babyProfile = babies.first
//        savedMenuCount = menus.filter { $0.isSaved }.count
//        todayMealPlan = getTodayMealPlan()
//        todayMotivation = getTodayMotivation()
//        todayArticle = getTodayArticle()
//        nextUnloggedMeal = getNextUnloggedMeal()
//    }
//    
//    var menus: [FoodMenu] {
//            return privateMenus
//        }
//    
//    private func getTodayMealPlan() -> MealPlan? {
//        let today = Calendar.current.startOfDay(for: Date())
//        return plans.first(where: { plan in
//            let start = Calendar.current.startOfDay(for: plan.startDate)
//            let end = Calendar.current.startOfDay(for: plan.endDate)
//            return start <= today && end >= today
//        })
//    }
//    
//    private func getNextUnloggedMeal() -> Meal? {
//        guard let plan = todayMealPlan else { return nil }
//        let today = Calendar.current.startOfDay(for: Date())
//        
//        return plan.meals?
//            .filter { Calendar.current.isDate($0.timeGiven, inSameDayAs: today) && !$0.isLogged }
//            .sorted { mealTypes.firstIndex(of: $0.type) ?? 99 < mealTypes.firstIndex(of: $1.type) ?? 99 }
//            .first
//    }
//    
//    private func getTodayMotivation() -> Motivation? {
//        let totalMotivations = motivations.count
//        guard totalMotivations > 0 else { return nil }
//        
//        let today = Calendar.current.startOfDay(for: Date())
//        let referenceDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1))!
//        let daysSinceReference = Calendar.current.dateComponents([.day], from: referenceDate, to: today).day ?? 0
//        let index = daysSinceReference % totalMotivations
//        
//        return motivations[index]
//    }
//    
//    private func getTodayArticle() -> Article? {
//        let totalArticles = articles.count
//        guard totalArticles > 0 else { return nil }
//        
//        let today = Calendar.current.startOfDay(for: Date())
//        let referenceDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1))!
//        let daysSinceReference = Calendar.current.dateComponents([.day], from: referenceDate, to: today).day ?? 0
//        let index = daysSinceReference % totalArticles
//        
//        return articles[index]
//    }
//}
