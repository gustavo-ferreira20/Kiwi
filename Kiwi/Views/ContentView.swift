//
//  ContentView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI

enum Tabs: Int {
    case overview = 0
    case news = 1
    case videos = 2
}


struct ContentView: View {
    @State private var selectedTab: Tabs = .overview

    var body: some View {
        ZStack {
            VStack {
                if selectedTab == .overview {
                    OverviewView()
                } else if selectedTab == .news {
                    NewsView()
                } else if selectedTab == .videos {
                    VideoView()
                }
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


