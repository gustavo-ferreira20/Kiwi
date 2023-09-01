//
//  FinancialNewsViewModel.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/9/1.
//

import Foundation

// let apiKey = "GBTIZXYABQ88U8P8"

class FinancialNewsViewModel: ObservableObject {
    @Published var newsArticles: [AlphaVantageArticle] = []

    func fetchNews() {
        
        let apiKey = "GBTIZXYABQ88U8P8"
        let urlString = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=AAPL&interval=5min&apikey=\(apiKey)"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(AlphaVantageResponse.self, from: data)
                        
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

