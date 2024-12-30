//
//  ArticleView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import SwiftUI
import SwiftData

struct ArticleView: View {
    @Environment(\.dismiss) var dismiss
   
    var article: Article

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center) {
                 
                        // Display the first article's title and image
                    Text(article.articleTitle)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.top, 20)

                    Image(article.articleImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 315, height: 200)
                            .cornerRadius(10)

                        // Display the article details
                    ForEach(Array(zip(article.articleSubheader, article.articleDesc)), id: \.0) { subheader, desc in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(subheader)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                            
                            Text(desc)
                                .font(.system(size: 12))
                                .padding(.bottom, 8)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                    }
                
                }
                .padding(20)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Sample Data for Preview
extension Article {
    static var sampleArticle: Article {
        
            Article(
                articleTitle: "Introduce new food with food chaining",
                articleImage: "motivationimage1",
                articleSubheader: ["What is Food Chaining?","Tips For Success:","Additional Tips:"],
                articleDesc: ["Food chaining is a method that starts with feeding a food a child likes, then using small changes to work toward a new food.","""

                    Tips For Success:
                    - Have fun and make it a game. Encourage your child to take \"mouse bites,\" \"alligator bites,\" or touch the food with their tongue.
                    - Focus on small steps & try one new item at a time. Keep trying!
                    - Many children have to try a food more than 10 times before they start to like it.
""","""
                    Additional Tips:
                    - Minimize distractions while your child is eating. (For example, turn off screens, put pets in another room, etc.)
                    - Don't pressure your child; let them decide when they want to stop.
                    - Plan meals & snacks ahead of time. Let your child know when to expect a meal or snack.
                    """])
      
        
    }
}




// MARK: - Preview
#Preview {
    ArticleView(article: Article.sampleArticle)
}
