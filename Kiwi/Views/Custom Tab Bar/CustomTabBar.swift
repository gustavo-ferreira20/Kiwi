//
//  CustomTabBar.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

import SwiftUI


enum Tabs: Int{
    case news = 0
    case overview = 1
    case videos = 2
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        
        HStack (alignment: .center){
            Button {
                // Swicth to News
                selectedTab = .news
            } label: {
                
                TabBarButton(buttonText: "News", imageName: "newspaper", isActive: selectedTab == .news)
            }
            .tint(Color.gray)
            
            Button {
                // Swicth to Overview
                selectedTab = .overview
            } label: {
                
                
                TabBarButton(buttonText: "Overview", imageName: "network", isActive: selectedTab == .overview)
                
                
            }
            .tint(Color.gray)
            
            Button {
                // Swicth to Videos
                selectedTab = .videos
            } label: {
                
                
                TabBarButton(buttonText: "Videos", imageName: "video", isActive: selectedTab == .videos)
                
            }
            .tint(Color.gray)

        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.overview))
    }
}
