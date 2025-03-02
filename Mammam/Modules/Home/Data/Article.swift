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
    var previewArticle: String
    var articleTitle: String
    var articleImage: String
    var articleSubheader: [String]
    var articleDesc: [String]
    
    var user : [User]?
    
    init(previewArticle: String, articleTitle: String, articleImage: String, articleSubheader: [String], articleDesc: [String]) {
        self.previewArticle = previewArticle
        self.articleTitle = articleTitle
        self.articleImage = articleImage
        self.articleSubheader = articleSubheader
        self.articleDesc = articleDesc
    }
}

