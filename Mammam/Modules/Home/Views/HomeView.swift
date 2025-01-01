//
//  HomeView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Query private var menus: [FoodMenu]
    @Query(sort: \MealPlan.startDate, order: .forward) private var plans: [MealPlan]
    private let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Heading
                headerSection
                
                // Conditional Sections
                if let todayPlan = todayMealPlan {
                    if let nextMealType = nextUnloggedMealType(from: todayPlan) {
                        currentMealTypeView(mealType: nextMealType)
                    } else {
                        allMealsLoggedView
                    }
                } else {
                    noMealPlanView
                }
                
                // Story of the Day
                storyOfTheDaySection
                
                // Article
                articleSection
                
                // Meal Plan
                if let todayPlan = todayMealPlan {
                    mealPlanSection(for: todayPlan)
                }
                
                // Menu
                menuSection
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
    
    // MARK: - Subviews
    
    private var headerSection: some View {
        HStack {
            Image(systemName: "leaf")
            Text("Hi, [Name]'s Mom")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Button(action: {
                coordinator.push(page: .savedMenu)
            }) {
                Image(systemName: "bookmark.fill")
            }
        }
    }
    
    private var noMealPlanView: some View {
        Button(action: {
            coordinator.push(page: .createMealPlan)
        }) {
            HStack {
                Label("Start Your Meal Plan Today!", systemImage: "lightbulb.fill")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray6))
            )
        }
    }
    
    private func currentMealTypeView(mealType: String) -> some View {
        Button(action: {
            // Navigate to logging view for the current meal type
            coordinator.push(page: .logMeal)
        }) {
            HStack {
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text("Log Meal")
                        .font(.headline)
                    Text(mealType)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray6))
            )
        }
    }
    
    private var allMealsLoggedView: some View {
        HStack {
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text("All Scheduled Meal Recorded Today")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray6))
        )
    }
    
    private var storyOfTheDaySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today's Story")
                .font(.headline)
            Button(action: {
                coordinator.push(page: .motivation)
            }) {
                ZStack {
                    Image("motivationimage1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 364, height: 129, alignment: .topLeading)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                    VStack(alignment: .leading) {
                        Text("#ResponsiveFeeding")
                            .font(.system(size: 13))
                            .foregroundColor(Color.theme.secondaryTextColor)
                            .padding(.top, 40)
                        HStack {
                            Text("Story Of The Day")
                                .font(.system(size: 22, weight: .bold))
                                .padding(.top, 10)
                                .foregroundColor(Color.theme.secondaryTextColor)
                                                      
                            Spacer()
                                                      
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                }
            }
        }
    }
    
    private var articleSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Understand Your Child Better")
                .font(.headline)
            Button(action: {
                coordinator.presentSheet(sheet: .article)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(.systemGray5))
                        .frame(height: 97)

                    HStack(alignment: .top, spacing: 20) {
                        VStack(alignment: .leading) {
                            Image("motivationimage1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 65, height: 65, alignment: .topLeading)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 5) {
                                Image(systemName: "book.pages")
                                Text("Article")
                                    .font(.system(size: 12))
                            }
                              
                            Text("Introduce new food with food chaining")
                                .font(.system(size: 16))
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
        }
    }
    
    private func mealPlanSection(for plan: MealPlan) -> some View {
        VStack(alignment: .leading) {
            Text("Your Meal Plan")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(
                        plan.meals?
                            .filter(isTodayMeal) // Keep only today's meals
                            .sorted {
                                MealTypeOrderUtility.mealTypeOrder($0.type) < MealTypeOrderUtility.mealTypeOrder($1.type)
                            } ?? [],
                        id: \.self
                    ) { meal in
                        MealCardComponent(meal: meal)
                    }
                }
            }
        }
    }

    private var menuSection: some View {
        VStack(alignment: .leading) {
            Text("Fresh-eye menu")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(menus) { food in
                        FoodMenuCardComponent(foodMenu: food)
                            .frame(width: 150)
                    }
                }
            }
        }
        .onChange(of: menus) { _ in
            try? context.save() // Force refresh on data changes
        }
        .onAppear {
            try? context.save() // Refresh data on view appear
        }
    }
       
    // MARK: - Helpers
    
    private var todayMealPlan: MealPlan? {
        let today = Calendar.current.startOfDay(for: Date())
        return plans.first(where: { plan in
            let start = Calendar.current.startOfDay(for: plan.startDate)
            let end = Calendar.current.startOfDay(for: plan.endDate)
            return start <= today && end >= today
        })
    }
    
    private func nextUnloggedMealType(from plan: MealPlan) -> String? {
        for type in mealTypes {
            if plan.meals?.first(where: { $0.type == type && !$0.isLogged }) != nil {
                return type
            }
        }
        return nil
    }
    
    private func isTodayMeal(meal: Meal) -> Bool {
        let today = Calendar.current.startOfDay(for: Date())
        let mealDate = Calendar.current.startOfDay(for: meal.timeGiven)
        return today == mealDate
    }
}

#Preview {
    HomeView()
        .environmentObject(Coordinator())
}
