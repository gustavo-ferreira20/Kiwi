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
    let urlToImage: String?
    let source: SourceName?
    let author: String?

    // Custom initializer for Decodable conformance
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try? container.decodeIfPresent(String.self, forKey: .title)
        self.description = try? container.decodeIfPresent(String.self, forKey: .description)
        self.url = try? container.decodeIfPresent(String.self, forKey: .url)
        self.urlToImage = try? container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.source = try? container.decodeIfPresent(SourceName.self, forKey: .source)
        self.author = try? container.decodeIfPresent(String.self, forKey: .author)
 
    }

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case url
        case urlToImage
        case source
        case author
    }
}


struct SourceName: Decodable{
    let name: String?
}



struct NewsAPIResponse: Decodable {
    let articles: [NewsArticle]
}



/*
 
 
 articles[0].urlToImage
 
 articles[0].source.name
 */
