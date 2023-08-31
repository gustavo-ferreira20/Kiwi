//
//  VideoView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI
import WebKit

struct VideoView: View {
    
    @StateObject private var youtubeService = YouTubeService()
    @State private var videos: [YouTubeVideo] = []
    @State private var isLoading = true
    
    var body: some View {

            NavigationStack {
                ZStack{
//                    Color.background.edgesIgnoringSafeArea(.all)
                    
                    
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
                                .listRowBackground(Color.systemBackground)
                            
                        }
                        .navigationTitle("Finance Videos")
                        .navigationBarTitleDisplayMode(.inline)
//                        .padding(.horizontal, 16)
                        .scrollContentBackground(.hidden)
                        .background(Color.systemBackground)
                        .listStyle(.plain)
                    }
                
                }
            }
        .onAppear {
            youtubeService.fetchVideos(query: "managing+personal+finance") { fetchedVideos in
                videos = fetchedVideos
                isLoading = false
            }
        }
    }

}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}

