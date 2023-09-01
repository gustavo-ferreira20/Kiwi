//
//  NewsArticle.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/9/1.
//

import Foundation




struct NewsArticle: Identifiable, Decodable {
    var id = UUID()
    let title: String?
    let description: String?
    let url: String?

    // Custom initializer for Decodable conformance
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try? container.decodeIfPresent(String.self, forKey: .title)
        self.description = try? container.decodeIfPresent(String.self, forKey: .description)
        self.url = try? container.decodeIfPresent(String.self, forKey: .url)
    }

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case url
    }
}





struct NewsAPIResponse: Decodable {
    let articles: [NewsArticle]
}
