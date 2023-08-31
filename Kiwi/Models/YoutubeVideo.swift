//
//  YoutubeVideo.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/28.
//

import Foundation




struct YouTubeVideo: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let videoId: String
    let thumbnailURL: URL

}




