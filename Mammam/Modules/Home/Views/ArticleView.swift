//
//  ArticleView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import SwiftData
import SwiftUI

struct ArticleView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ArticleViewModel

    init(article: Article) {
        _viewModel = StateObject(wrappedValue: ArticleViewModel(article: article))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(viewModel.article.articleTitle)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top, 20)

                Image(viewModel.article.articleImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 315, height: 200)
                    .cornerRadius(10)

                ForEach(viewModel.articleContent(), id: \.0) { subheader, desc in
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
