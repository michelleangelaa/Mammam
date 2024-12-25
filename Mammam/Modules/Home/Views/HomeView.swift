//
//  HomePageView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//
//
import SwiftData
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var navigateToMotivation = false
    @Query(sort: \MealPlan.startDate, order: .forward) private var plans: [MealPlan]
    @Query private var foodMenus: [FoodMenu]

    private let mealTypes = ["Breakfast", "Morning Snack", "Lunch", "Evening Snack", "Dinner"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Heading
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
                
            // Log Meal
            Text("Let's Record Baby's Meal")
                .font(.system(size: 17, weight: .bold))
            
            // Motivation CTA
            VStack(alignment: .leading, spacing: 12) {
                Text("Today's Story")
                    .font(.system(size: 17, weight: .bold))
                    
                Button(action: {
                    coordinator.push(page: .motivation) // Use the Coordinator to navigate
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

            // Article CTA
            VStack(alignment: .leading, spacing: 12) {
                Text("Understand Your Child Better")
                    .font(.system(size: 17, weight: .bold))
                    
                Button(action: {
                    coordinator.presentSheet(sheet: .article) // Show article sheet
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(.systemGray5))
                            .frame(height: 97)
                            
                        HStack(spacing: 20) {
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
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .padding()
                    }
                }
            }
            
            // Meal Plan
            Text("Your Meal Plan")
                .font(.system(size: 17, weight: .bold))
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(todaysMeals, id: \.self) { meal in
                        MealCardComponent(meal: meal)
                            .frame(width: 122)
                    }
                }
            }
            
            // Menu
            Text("Fresh-eye menu")
                .font(.system(size: 17, weight: .bold))
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(foodMenus, id: \.self) { food in
                        FoodMenuCardComponent(foodMenu: food)
                            .frame(width: 122)
                    }
                }
            }
            .frame(height: 171)
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    private var todaysMeals: [Meal] {
        let today = Calendar.current.startOfDay(for: Date())
        let meals = plans.flatMap { $0.meals ?? [] }
        return meals.filter { meal in
            Calendar.current.isDate(meal.timeGiven, inSameDayAs: today) && mealTypes.contains(meal.type)
        }
    }
    //        CustomLargeButtonComponent(state: .enabled, text: "mau ke profile page") {
    //            coordinator.push(page: .login)
    //        }
//                Button {
//                    coordinator.push(page: .login)
//                } label: {
//                    Text("go to login but profile")
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
    //
    
//            .navigationDestination(isPresented: $navigateToMotivation) {
//                MotivationView()
//                    .navigationBarBackButtonHidden(true)
//            }
//        TabBarView()
}

#Preview {
    HomeView()
        .environmentObject(Coordinator())
}
