//
//  VideoListView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/28.
//

import SwiftUI
import WebKit


struct VideoListView: View {
    @StateObject private var youtubeService = YouTubeService()
    @State private var videos: [YouTubeVideo] = []
    @State private var isLoading = true
    
    var body: some View {

            VStack {
                if isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    List(videos) { video in
                        VStack(alignment: .leading) {
                            Text(video.title)
                                .font(.headline)
                            Text(video.description)
                                .font(.subheadline)
                            WebView(urlString: "https://www.youtube.com/embed/\(video.videoId)")
                                .frame(height: 200)
                        }
                    }
                }
            }
        .onAppear {
            youtubeService.fetchVideos(query: "finance") { fetchedVideos in
                videos = fetchedVideos
                isLoading = false  
            }
        }
        .navigationBarTitle("Finance Videos")
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
