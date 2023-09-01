//
//  NewsView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI


struct NewsView: View {
    
    @ObservedObject var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.newsArticles) { article in
                NavigationLink(destination: WebView(urlString: article.url ?? "")) {
                    VStack(alignment: .leading) {
                        Text(article.title ?? "")
                            .font(.headline)
                        Text(article.description ?? "")
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
