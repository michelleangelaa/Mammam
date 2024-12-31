//
//  Article.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.
//

import Foundation
import SwiftData

@Model
class Article {
    var articleTitle: String
    var articleImage: String
    var articleSubheader: String
    var articleDesc: String
    
//    @Relationship(inverse: \Baby.articles)
//    var baby : [Baby]?
    
    init(articleTitle: String, articleImage: String, articleSubheader: String, articleDesc: String) {
        self.articleTitle = articleTitle
        self.articleImage = articleImage
        self.articleSubheader = articleSubheader
        self.articleDesc = articleDesc
    }
   
}

