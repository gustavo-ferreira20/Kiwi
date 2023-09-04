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
//    var body: some View {
//        NavigationView {
//            List(viewModel.newsArticles) { article in
//                NavigationLink(destination: WebView(urlString: article.url ?? "")) {
//                    VStack(alignment: .leading) {
//                        Text(article.title ?? "")
//                            .font(.headline)
//                        Text(article.description ?? "")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                    }
//                }
//            }
//            .navigationBarTitle("Finance News")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        .onAppear {
//            viewModel.fetchFinanceNews()
//        }
//    }
//}


struct NewsView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    
    init() {
        // Customize the navigation bar appearance
        let appearance = UINavigationBarAppearance()
        
        // Set the color of the bottom border
        appearance.shadowColor = .systemGreen
                
        // Apply the custom appearance to the navigation bar
        UINavigationBar.appearance().standardAppearance = appearance
    }

    var body: some View {
        NavigationView {
            
            List(viewModel.newsArticles) { article in
                NavigationLink(destination: WebView(urlString: article.url ?? "")) {
                    VStack(alignment: .leading) {
                        Text(article.title ?? "")
                            .font(.headline)
                            .padding(.bottom, 4)
                        Text(article.description ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                }
//                .listRowBackground(Color.background)
                .listRowSeparator(.hidden)
                .buttonStyle(PlainButtonStyle())
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle("Finance News")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarSeparatorHidden(false) // Show the navigation bar separator
            .scrollContentBackground(.hidden)
            .background(Color.background)
        }
        .onAppear {
            viewModel.fetchFinanceNews()
        }
    }
}

@available(iOS 15.0, *)
extension View {
    func navigationBarSeparatorHidden(_ hidden: Bool) -> some View {
        modifier(NavigationBarSeparatorModifier(hidden: hidden))
    }
}

@available(iOS 15.0, *)
struct NavigationBarSeparatorModifier: ViewModifier {
    var hidden: Bool

    func body(content: Content) -> some View {
        content.background(
            NavigationBarSeparator(hidden: hidden)
                .frame(height: hidden ? 0 : 1)
                .foregroundColor(Color.gray.opacity(0.4))
                .edgesIgnoringSafeArea(.bottom)
        )
    }
}

@available(iOS 15.0, *)
struct NavigationBarSeparator: UIViewRepresentable {
    var hidden: Bool

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.isHidden = hidden
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
