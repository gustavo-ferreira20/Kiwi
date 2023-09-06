//
//  NewsView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI


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
                            Text(article.source?.name ?? "")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.icon)
                            Text(article.title ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
                                .lineLimit(2) // Limit title to 2 lines
                                .foregroundColor(Color.text)
                            Text(article.description ?? "")
                                .font(.subheadline)
                                .lineLimit(1) // Limit description to 1 line
                                .foregroundColor(.secondary)
                                .padding(.bottom, 4) // not working *******
                            HStack {
                                Image(systemName: "highlighter")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.gray)
                                Text(article.author ?? "")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                    .padding(.trailing, 3)
                                Image(systemName: "clock.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color.gray)
                                Text("\(viewModel.daysPassedSinceAPIDate(apiDateString: article.publishedAt ?? "") ?? 0 < 2 ?"Today" : "\(viewModel.daysPassedSinceAPIDate(apiDateString: article.publishedAt ?? "") ?? 0)d ago")")
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 0)

                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 130)
                    .padding(12)
                    .background(Color.newsBackground)
                }
                .buttonStyle(PlainButtonStyle())
                .listRowSeparator(.hidden) // Hide cell separators
                .listRowBackground(Color.newsBackground)
            }
            .navigationBarTitle("News & Tips")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.newsBackground)
            .listStyle(PlainListStyle()) // rows to take up the entire width
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
