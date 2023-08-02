//
//  NewsView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI

struct NewsView: View {
    @StateObject private var locationViewModel = LocationViewModel()
    
    var body: some View {
        Text("News View")

        VStack {
            if let country = locationViewModel.country {
                Text("Your current country: \(country)")
            } else {
                Text("Loading...")
                    .onAppear {
                        locationViewModel.fetchCountryName()

                    }
            }
        }
        
    }



}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
