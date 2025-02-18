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
    var previewMotivation : String
    var imageStory1: String
    var imageStory2: String
    var imageTrue: String
    var imageFalse: String
    var buttonText1: String
    var buttonText2: String
    var quotes : String
    var quotesSource : String
    var adviceImage : [String]
    var adviceText : [String]
    
    var user : [User]?
        
    init(previewMotivation: String, imageStory1: String, imageStory2: String, imageTrue: String, imageFalse: String, buttonText1: String, buttonText2: String, quotes: String, quotesSource: String, adviceImage: [String], adviceText: [String]) {
        self.previewMotivation = previewMotivation
        self.imageStory1 = imageStory1
        self.imageStory2 = imageStory2
        self.imageTrue = imageTrue
        self.imageFalse = imageFalse
        self.buttonText1 = buttonText1
        self.buttonText2 = buttonText2
        self.quotes = quotes
        self.quotesSource = quotesSource
        self.adviceImage = adviceImage
        self.adviceText = adviceText
    }
}
