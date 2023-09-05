//
//  NewsViewModel.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/9/1.
//

import Foundation




class NewsViewModel: ObservableObject {
    @Published var newsArticles: [NewsArticle] = []

    func fetchFinanceNews() {
        let apiKey = "3de37b845a0b4040927140e27b4bab0d"
        let urlString = "https://newsapi.org/v2/everything?q=finance+tips&language=en&apiKey=\(apiKey)"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let response = try decoder.decode(NewsAPIResponse.self, from: data)

                        DispatchQueue.main.async {
                            // Filter out articles with all nil properties
                            let filteredArticles = response.articles.filter { $0.title != nil || $0.description != nil || $0.url != nil || $0.urlToImage != nil || $0.source != nil || $0.author != nil }

                            // Clear the existing articles before appending new ones
                            self.newsArticles.removeAll()

                            // Append the filtered articles
                            self.newsArticles.append(contentsOf: filteredArticles)
                            
                        }
                    } catch {
                        print(error.localizedDescription)
                        debugPrint(error)
                    }
                }
            }.resume()
        }
    }
}











