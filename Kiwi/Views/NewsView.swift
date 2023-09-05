//
//  NewsView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI



//struct NewsView: View {
//
//    @ObservedObject var viewModel = NewsViewModel()
//
//
//    var body: some View {
//
//        NavigationView {
//
//            //MARK: List of News and Tips
//                List(viewModel.newsArticles) { article in
//                    NavigationLink(destination: WebView(urlString: article.url ?? "")) {
//                        // Image
//
//                        HStack(spacing: 10) {
//
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.newsBox)
//                                .frame(width: 80, height: 80)
//                                .overlay(
//                                    AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
//                                        switch phase {
//                                        case .empty:
//                                            ProgressView()
//                                        case .success(let image):
//                                            image
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                        case .failure:
//                                            Image(systemName: "photo")
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                        @unknown default:
//                                            EmptyView()
//                                        }
//                                    }
//                                ) // Rounded corners
//
//
//                        VStack(alignment: .leading) {
//                            Text(article.title ?? "")
//                                .font(.headline)
//                                .lineLimit(2)
//                                .padding(.bottom, 4)
//                            Text(article.description ?? "")
//                                .font(.subheadline)
//                                .lineLimit(1)
//                                .foregroundColor(.secondary)
//                        }
//                    }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(12)
//                        .background(Color.pink) //88888
//                        .cornerRadius(15)
//                        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
//                    }
//                    .listRowBackground(Color.yellow) //8888
//                    .listRowSeparator(.hidden)
//                    .buttonStyle(PlainButtonStyle())
//                }
//                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                .navigationBarTitle("News & Tips")
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarSeparatorHidden(false) // Show the navigation bar separator
//                .scrollContentBackground(.hidden)
//                .background(Color.blue) // 888888
//
//        }
//        .navigationBarTitleDisplayMode(.inline)
//        .onAppear {
//            viewModel.fetchFinanceNews()
//        }
//    }
//}


struct NewsView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.newsArticles, id: \.id) { article in
                NavigationLink(destination: WebView(urlString: article.url ?? "")) {
                    HStack(spacing: 10) {
                        // Rounded image 
                        AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(article.title ?? "")
                                .font(.headline)
                                .lineLimit(2) // Limit title to 2 lines
                            Text(article.description ?? "")
                                .font(.subheadline)
                                .lineLimit(1) // Limit description to 1 line
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(Color.pink)
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                }
                .buttonStyle(PlainButtonStyle())
                .listRowSeparator(.hidden) // Hide cell separators
            }
            .navigationBarTitle("News & Tips")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.blue)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchFinanceNews()
        }
    }
}




struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
