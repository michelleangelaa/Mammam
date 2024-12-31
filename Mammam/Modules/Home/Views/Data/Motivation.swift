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
    var imageStory1: String
    var imageStory2: String
    var imageTrue: String
    var imageFalse: String
    var quotes : String
    var tips : String
    
//    @Relationship(inverse: \Baby.motivation)
//    var baby : [Baby]?
//    
    init(imageStory1: String, imageStory2: String, imageTrue: String, imageFalse: String, quotes: String, tips: String) {
        self.imageStory1 = imageStory1
        self.imageStory2 = imageStory2
        self.imageTrue = imageTrue
        self.imageFalse = imageFalse
        self.quotes = quotes
        self.tips = tips
    }
}
