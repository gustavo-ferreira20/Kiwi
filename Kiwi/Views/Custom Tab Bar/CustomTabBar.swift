//
//  CustomTabBar.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//



import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                selectedTab = .overview
            }) {
                TabBarButton(buttonText: "Overview", imageName: "house", isActive: selectedTab == .overview)
                    
            }
            
            Button(action: {
                selectedTab = .news
            }) {
                TabBarButton(buttonText: "News", imageName: "newspaper", isActive: selectedTab == .news)
            }
            
            Button(action: {
                selectedTab = .videos
            }) {
                TabBarButton(buttonText: "Videos", imageName: "video", isActive: selectedTab == .videos)
            }
        }
        .frame(height: 82)
    }
}

