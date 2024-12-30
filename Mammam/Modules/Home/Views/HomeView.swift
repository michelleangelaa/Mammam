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
    @Query private var articles: [Article] // Query for articles
    @State private var randomizedArticles: [Article] = []
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
//                coordinator.push(page: .motivation)
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
            Text("Articles")
                .font(.title2)
                .fontWeight(.bold)
            
            if let firstArticle = articles.first {
            Button(action: {
                coordinator.presentArticleDetailSheet(with: firstArticle)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(.systemGray5))
                        .frame(height: 97)
                    
                    HStack(alignment: .top, spacing: 20) {
                        Image(firstArticle.articleImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 65, height: 65)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 5) {
                                Image(systemName: "book.pages")
                                Text("Article")
                                    .font(.system(size: 12))
                            }
                            
                            Text(firstArticle.articleTitle)
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding()
                }
            }
            } else {
                        Text("No articles available")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
            
        }.onAppear {
            try? context.save() // Refresh data on view appear
        }
    }
        
    
    private func mealPlanSection(for plan: MealPlan) -> some View {
        VStack(alignment: .leading) {
            Text("Your Meal Plan")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(plan.meals?.filter(isTodayMeal) ?? [], id: \.self) { meal in
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
                HStack {
                    ForEach(menus) { food in
                        FoodMenuCardComponent(foodMenu: .constant(food))
                            .frame(width: 150)
                    }
                }
            }
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
