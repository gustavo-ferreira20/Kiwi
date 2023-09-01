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
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&q=finance&apiKey=\(apiKey)"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(NewsAPIResponse.self, from: data)

                        DispatchQueue.main.async {
                            self.newsArticles = response.articles
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}

