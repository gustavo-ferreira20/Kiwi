//
//  FinancialNewsArticle.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/9/1.
//

import Foundation



struct AlphaVantageResponse: Decodable {
    let articles: [AlphaVantageArticle]

    private enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}

struct AlphaVantageArticle: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let url: String

    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case url = "url"
    }
}

