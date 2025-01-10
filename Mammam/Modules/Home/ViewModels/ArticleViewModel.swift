//
//  ArticleViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 10/01/25.
//

import Foundation
import SwiftUI

class ArticleViewModel: ObservableObject {
    @Published var article: Article

    init(article: Article) {
        self.article = article
    }

    func articleContent() -> [(String, String)] {
        Array(zip(article.articleSubheader, article.articleDesc))
    }
}
