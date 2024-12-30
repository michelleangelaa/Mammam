//
//  Motivation.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.
//

import Foundation
import SwiftData

@Model
class Motivation {
    var imageStory1: [String]
    var imageTrue: String
    var imageFalse: String
    var imageAdvice : [String]
    var quotes : String
    var quotesSource : String
    var tips : [String]
//
//    @Relationship(inverse: \Baby.motivation)
//    var baby : [Baby]?
    
    init(imageStory1: [String], imageTrue: String, imageFalse: String, imageAdvice: [String], quotes: String, quotesSource: String, tips: [String]) {
        self.imageStory1 = imageStory1
        self.imageTrue = imageTrue
        self.imageFalse = imageFalse
        self.imageAdvice = imageAdvice
        self.quotes = quotes
        self.quotesSource = quotesSource
        self.tips = tips
    }
   
}
