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
//        let urlString = "https://newsapi.org/v2/everything?q=finance+tips&language=en&apiKey=\(apiKey)"
        let urlString = "https://newsapi.org/v2/everything?q=finance+tips&language=en&sortBy=publishedAt&apiKey=\(apiKey)"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let response = try decoder.decode(NewsAPIResponse.self, from: data)

                        DispatchQueue.main.async {
                            // Filter out articles with all nil properties
                            let filteredArticles = response.articles.filter { $0.title != nil || $0.description != nil || $0.url != nil || $0.urlToImage != nil || $0.source != nil || $0.author != nil || $0.publishedAt != nil }

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
    
    func daysPassedSinceAPIDate(apiDateString: String) -> Int? {
        // Create a DateFormatter to parse the API date string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Specify the date format used in the API string
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Set the locale to ensure consistent date parsing
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // Set the timezone if needed

        // Convert the API date string to a Date object
        if let apiDate = dateFormatter.date(from: apiDateString) {
            // Get the current date
            let currentDate = Date()

            // Calculate the time interval between the current date and the API date
            let timeInterval = currentDate.timeIntervalSince(apiDate)

            // Calculate the number of days passed by dividing the time interval by the number of seconds in a day
            let daysPassed = Int(timeInterval / (60 * 60 * 24))

            return daysPassed
        } else {
            return nil // Return nil if the API date string couldn't be parsed
        }
    }

}











