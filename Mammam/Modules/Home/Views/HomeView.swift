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
    @Query private var baby: [Baby]
    @Query(sort: \MealPlan.startDate, order: .forward) private var plans: [MealPlan]
    private let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]

    var body: some View {
        ZStack {
            Image("BG_Home")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Heading
                    headerSection
                        
                    // Conditional Sections
                    if let todayPlan = todayMealPlan {
                        if let unloggedMeal = nextUnloggedMeal(from: todayPlan) {
                            currentMealTypeView(meal: unloggedMeal)
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
                .padding(.top, 65)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Subviews
    
    private var headerSection: some View {
        HStack {
            Circle()
                .fill(Color.pink.opacity(0.2))
                .frame(width: 36, height: 36)
                .overlay(
                    Text(baby.first?.babyProfileImage ?? "􀉪")
                        .font(.title2)
                )
            Text("Hi, \(baby.first?.babyName ?? "")'s Mom")
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
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Label("Start Your Meal Plan Today!", systemImage: "lightbulb.fill")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        Text("Introduce a variety of new foods with ease")
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray6))
            )
        }
    }
    
    private func currentMealTypeView(meal: Meal) -> some View {
        Button(action: {
            // Present the Rate Meal Sheet for the specific meal
            coordinator.presentRateMealSheet(with: meal)
        }) {
            HStack {
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text("Log Meal")
                        .font(.headline)
                    Text(meal.type)
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
                HStack(alignment: .top, spacing: 20) {
                    Image("motivationimage1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65, alignment: .topLeading)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 5) {
                            Image(systemName: "book.pages")
                            Text("Article")
                                .font(.system(size: 12))
                        }
                              
                        Text("Introduce new food with food chaining")
                            .font(.callout)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.blue.blue25)
                        .frame(height: 97)
                )
                
            }
        }
    }
    
    private func mealPlanSection(for plan: MealPlan) -> some View {
        // Filter today's unlogged meals
        let unloggedMeals = plan.meals?
            .filter { isTodayMeal(meal: $0) && !$0.isLogged }
            .sorted {
                MealTypeOrderUtility.mealTypeOrder($0.type) < MealTypeOrderUtility.mealTypeOrder($1.type)
            } ?? []

        return Group {
            if !unloggedMeals.isEmpty {
                VStack(alignment: .leading) {
                    Text("Today's Meal Plan")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(unloggedMeals, id: \.self) { meal in
                                Button(action: {
                                    coordinator.presentMealDetailSheet(with: meal)
                                }) {
                                    MealCardComponent(meal: meal)
                                }
                            }
                        }
//                        .padding(.horizontal)
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
                            .onTapGesture {
                                coordinator.presentSheet(sheet: .foodMenuDetail(foodMenu: food))
                            }
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
    
    private func nextUnloggedMeal(from plan: MealPlan) -> Meal? {
        let today = Calendar.current.startOfDay(for: Date())

        // Filter meals scheduled for today
        let todaysMeals = plan.meals?
            .filter { isTodayMeal(meal: $0) } ?? []

        // Sort by MealType order
        let sortedMeals = todaysMeals.sorted {
            MealTypeOrderUtility.mealTypeOrder($0.type) < MealTypeOrderUtility.mealTypeOrder($1.type)
        }

        // Return the first unlogged meal
        return sortedMeals.first(where: { !$0.isLogged })
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
