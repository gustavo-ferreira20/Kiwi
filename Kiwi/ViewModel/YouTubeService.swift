//
//  YouTubeService.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/28.
//

import Foundation

//https://www.googleapis.com/youtube/v3/search?key=AIzaSyCRupgrNGe6KXPnKm2IWBwazF43mXyiw3o&q=finance&type=video&part=snippet&maxResults=10


class YouTubeService: ObservableObject {
    let apiKey = "AIzaSyCRupgrNGe6KXPnKm2IWBwazF43mXyiw3o"
    
    func fetchVideos(query: String, completion: @escaping ([YouTubeVideo]) -> Void) {
        let urlString = "https://www.googleapis.com/youtube/v3/search?key=\(apiKey)&q=\(query)&type=video&part=snippet&maxResults=10&regionCode=US"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(YouTubeVideoResponse.self, from: data)
                        
                        // Convert items from response to YouTubeVideo array
                        let videos = response.videoItems
                        
                        completion(videos)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}



