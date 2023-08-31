//
//  YouTubeVideoResponse.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/28.
//

import Foundation



struct YouTubeVideoResponse: Decodable {
    let items: [Item]

    struct Item: Decodable {
        let id: VideoId
        let snippet: Snippet
    }

    struct VideoId: Decodable {
        let videoId: String
    }



    struct Snippet: Decodable {
        let title: String
        let description: String
        let thumbnails: Thumbnails



        struct Thumbnails: Decodable {
            let medium: Thumbnail
            let high: Thumbnail

            struct Thumbnail: Decodable {
                let url: URL
            }
        }
    }

    var videoItems: [YouTubeVideo] {
        return items.map { item in
            let snippet = item.snippet
            let videoId = item.id.videoId
            let thumbnailURL = snippet.thumbnails.medium.url

            return YouTubeVideo(
                title: snippet.title,
                description: snippet.description,
                videoId: videoId,
                thumbnailURL: thumbnailURL
            )
        }
    }
}











