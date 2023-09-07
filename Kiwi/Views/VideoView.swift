//
//  VideoView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI
import WebKit

//struct VideoView: View {
//
//    @StateObject private var youtubeService = YouTubeService()
//    @State private var videos: [YouTubeVideo] = []
//    @State private var isLoading = true
//
//    var body: some View {
//
//
//            NavigationStack {
//                ZStack{
////                    Color.background.edgesIgnoringSafeArea(.all)
//
//
//                    if isLoading {
//                        ProgressView("Loading...")
//                            .padding()
//                    } else {
//
//                        List(videos) { video in
//                                VStack(alignment: .leading) {
//                                    Text(video.title)
//                                        .font(.headline)
//                                    Text(video.description)
//                                        .font(.subheadline)
//                                    WebView(urlString: "https://www.youtube.com/embed/\(video.videoId)")
//                                            .frame(height: 200)
//
//                                }
//                                .listRowBackground(Color.systemBackground)
//
//                        }
//                        .navigationTitle("Finance Videos")
//                        .navigationBarTitleDisplayMode(.inline)
////                        .padding(.horizontal, 16)
//                        .scrollContentBackground(.hidden)
//                        .background(Color.systemBackground)
//                        .listStyle(PlainListStyle())
//                    }
//
//                }
//            }
//        .onAppear {
//            youtubeService.fetchVideos(query: "managing+personal+finance") { fetchedVideos in
//                videos = fetchedVideos
//                isLoading = false
//            }
//        }
//    }
//
//}


//================================

//struct VideoView: View {
//
//    @StateObject private var youtubeService = YouTubeService()
//    @State private var videos: [YouTubeVideo] = []
//    @State private var isLoading = true
//    private var searchingQuery = ["Management Tips", "Personal Finances", "Improve My Finances", "Stock Market Quotes", "Personal Budget", "Organising My Finances", "Personal Finance Advice"]
//
//    @State private var selectedQuery: String?
//
//    var body: some View {
//
//
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: [GridItem(.flexible())]) {
//                ForEach(searchingQuery, id: \.self) { query in
//                    Button(action: {
//                        // Replace spaces with "+" and set it as selectedQuery
//                            selectedQuery = query.replacingOccurrences(of: " ", with: "+")
//
//                        // selected query
//                        print("Tapped: \(selectedQuery ?? "")")
//                    }) {
//                        Rectangle()
//                            .frame(width: 120, height: 120)
//                            .foregroundColor(Color.white)
//                            .cornerRadius(10)
//                            .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
//                            .overlay(
//                                VStack {
//                                    switch query {
//                                    case "Management Tips":
//                                        Text("💁🏻‍♂️")
//                                            .font(.system(size: 38))
//                                    case "Personal Finances":
//                                        Text("🏦")
//                                            .font(.system(size: 38))
//                                    case "Improve My Finances":
//                                        Text("🤑")
//                                            .font(.system(size: 38))
//                                    case "Personal Finance Advice":
//                                        Text("🆘")
//                                            .font(.system(size: 38))
//                                    case "Stock Market Quotes":
//                                        Text("📈")
//                                            .font(.system(size: 38))
//                                    case "Personal Budget":
//                                        Text("💲")
//                                            .font(.system(size: 38))
//                                    case "Organising My Finances":
//                                        Text("💳")
//                                            .font(.system(size: 38))
//                                    default:
//                                        Text("")
//                                    }
//                                    Text(query)
//                                        .foregroundColor(.black)
//                                        .font(.system(size: 14))
//                                        .padding(4)
//                                }
//                            )
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                }
//            }
//            .padding(5)
//        }
//
//
//            NavigationStack {
//                ZStack{
////                    Color.background.edgesIgnoringSafeArea(.all)
//
//
//                    if isLoading {
//                        ProgressView("Loading...")
//                            .padding()
//                    } else {
//
//                        List(videos) { video in
//                                VStack(alignment: .leading) {
//                                    Text(video.title)
//                                        .font(.headline)
//                                    Text(video.description)
//                                        .font(.subheadline)
//                                    WebView(urlString: "https://www.youtube.com/embed/\(video.videoId)")
//                                            .frame(height: 200)
//
//                                }
//                                .listRowBackground(Color.systemBackground)
//
//                        }
//                        .navigationTitle("Finance Videos")
//                        .navigationBarTitleDisplayMode(.inline)
////                        .padding(.horizontal, 16)
//                        .scrollContentBackground(.hidden)
//                        .background(Color.systemBackground)
//                        .listStyle(PlainListStyle())
//                    }
//
//                }
//            }
//        .onAppear {
//            youtubeService.fetchVideos(query: "managing+personal+finance") { fetchedVideos in
//                videos = fetchedVideos
//                isLoading = false
//            }
//        }
//    }
//
//}


//=========

//struct VideoView: View {
//
//    @StateObject private var youtubeService = YouTubeService()
//    @State private var videos: [YouTubeVideo] = []
//    @State private var isLoading = true
//    private var searchingQuery = ["Management Tips", "Personal Finances", "Improve My Finances", "Stock Market Quotes", "Personal Budget", "Organising My Finances", "Personal Finance Advice"]
//
//    @State private var selectedQuery: String?
//
//    var body: some View {
//
//        NavigationStack {
//            ScrollView(.horizontal) {
//                LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
//                    ForEach(searchingQuery, id: \.self) { query in
//                        Button(action: {
//                            // Replace spaces with "+" and set it as selectedQuery
//                                selectedQuery = query.replacingOccurrences(of: " ", with: "+")
//
//                            // selected query
//                            print("Tapped: \(selectedQuery ?? "")")
//                        }) {
//                            Rectangle()
//                                .frame(width: 120, height: 120)
//                                .foregroundColor(Color.white)
//                                .cornerRadius(10)
//                                .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
//                                .overlay(
//                                    VStack {
//                                        switch query {
//                                        case "Management Tips":
//                                            Text("💁🏻‍♂️")
//                                                .font(.system(size: 38))
//                                        case "Personal Finances":
//                                            Text("🏦")
//                                                .font(.system(size: 38))
//                                        case "Improve My Finances":
//                                            Text("🤑")
//                                                .font(.system(size: 38))
//                                        case "Personal Finance Advice":
//                                            Text("🆘")
//                                                .font(.system(size: 38))
//                                        case "Stock Market Quotes":
//                                            Text("📈")
//                                                .font(.system(size: 38))
//                                        case "Personal Budget":
//                                            Text("💲")
//                                                .font(.system(size: 38))
//                                        case "Organising My Finances":
//                                            Text("💳")
//                                                .font(.system(size: 38))
//                                        default:
//                                            Text("")
//                                        }
//                                        Text(query)
//                                            .foregroundColor(.black)
//                                            .font(.system(size: 14))
//                                            .padding(4)
//                                    }
//                                )
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//            }
//            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
//
//            if isLoading {
//                ProgressView("Loading...")
//                    .padding()
//            } else {
//                List(videos) { video in
//                    VStack(alignment: .leading) {
//                        Text(video.title)
//                            .font(.headline)
//                        Text(video.description)
//                            .font(.subheadline)
//                        WebView(urlString: "https://www.youtube.com/embed/\(video.videoId)")
//                            .frame(height: 200)
//                    }
//                    .listRowBackground(Color.systemBackground)
//                }
//                .navigationTitle("Finance Videos")
//                .navigationBarTitleDisplayMode(.inline)
//                .scrollContentBackground(.hidden)
//                .background(Color.systemBackground)
//                .listStyle(PlainListStyle())
//                .padding(.top, 5)
//            }
//        }
//        .onAppear {
//            youtubeService.fetchVideos(query: "managing+personal+finance") { fetchedVideos in
//                videos = fetchedVideos
//                isLoading = false
//            }
//        }
//    }
//}



struct VideoView: View {

    @StateObject private var youtubeService = YouTubeService()
    @State private var videos: [YouTubeVideo] = []
    @State private var isLoading = true
    private var searchingQuery = ["Management Tips", "Personal Finances", "Improve My Finances", "Stock Market Quotes", "Personal Budget", "Organizing My Finances", "Personal Finance Advice"]
    
    @State private var selectedQuery: String?

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(searchingQuery, id: \.self) { query in
                            Button(action: {
                                selectedQuery = query.replacingOccurrences(of: " ", with: "+")
                                print("Tapped: \(selectedQuery ?? "")")
                                fetchVideosForSelectedQuery()
                            }) {
                                VStack {
                                    getEmojiForQuery(query)
                                        .font(.system(size: 38))
                                    Text(query)
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.icon)
                                        .fontWeight(.bold)
                                        .padding(4)
                                }
                                .frame(width: 120, height: 120)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
                
                if isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    List(videos) { video in
                        VStack(alignment: .leading) {
                            Text(video.title)
                                .font(.headline)
//                            Text(video.description)
//                                .font(.subheadline)
                            WebView(urlString: "https://www.youtube.com/embed/\(video.videoId)")
                                .frame(height: 250)
                                .cornerRadius(10)
                        }
                        .listRowBackground(Color(UIColor.systemBackground))
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarTitle("Finance Videos")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                youtubeService.fetchVideos(query: "managing+personal+finance") { fetchedVideos in
                    videos = fetchedVideos
                    isLoading = false
                }
            }
        }
    }
    
    private func getEmojiForQuery(_ query: String) -> Text {
        switch query {
        case "Management Tips":
            return Text("💁🏻‍♂️")
        case "Personal Finances":
            return Text("🏦")
        case "Improve My Finances":
            return Text("🤑")
        case "Personal Finance Advice":
            return Text("🆘")
        case "Stock Market Quotes":
            return Text("📈")
        case "Personal Budget":
            return Text("💲")
        case "Organizing My Finances":
            return Text("💳")
        default:
            return Text("")
        }
    }
    
    
    private func fetchVideosForSelectedQuery() {
        isLoading = true
        if let selectedQuery = selectedQuery {
            youtubeService.fetchVideos(query: selectedQuery) { fetchedVideos in
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

