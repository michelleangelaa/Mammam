//
//  Baby.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.
//

import Foundation
import SwiftData

@Model
class Baby {
    var babyProfileImage: String
    var babyName: String
    var babyBirthDate: Date
    @Relationship(deleteRule:.cascade)
    var allergen: [Allergen]?
    
    @Relationship(deleteRule:.cascade)
    var articles: [Article]?
    
    @Relationship(deleteRule:.cascade)
    var motivation: [Motivation]?
    
    @Relationship(deleteRule:.cascade)
    var mealPlans: [MealPlan]?
    
  
    var user : User?
    
    init(babyProfileImage: String, babyName: String, babyBirthDate: Date, allergen: [Allergen]? = nil, articles: [Article]? = nil, motivation: [Motivation]? = nil, mealPlans: [MealPlan]? = nil, user: User? = nil) {
        self.babyProfileImage = babyProfileImage
        self.babyName = babyName
        self.babyBirthDate = babyBirthDate
        self.allergen = allergen
        self.articles = articles
        self.motivation = motivation
        self.mealPlans = mealPlans
        self.user = user
    }
}


