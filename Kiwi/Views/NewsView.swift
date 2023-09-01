//
//  NewsView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI

// 3de37b845a0b4040927140e27b4bab0d

struct NewsView: View {
    
    @ObservedObject var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.newsArticles) { article in
                NavigationLink(destination: WebView(urlString: article.url)) {
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        Text(article.description ?? "--")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Finance News")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchFinanceNews()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
