//
//  ContentView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

//import SwiftUI
//
//
//struct Overview: View {
//
//    @State var selectedTab: Tabs = .overview
//
//
//    var body: some View {
//
//        ZStack {
////            Main Content View
//            VStack {
//                if selectedTab == .news {
//                    NewsView()
//                } else if selectedTab == .overview {
//                    OverviewView()
//                } else if selectedTab == .videos {
//                    VideoView()
//                }
//                    Spacer()
//                    CustomTabBar(selectedTab: $selectedTab)
//
//            }
//        }
//
//    }
//}
//
//struct Overview_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview()
//    }
//}


// -----

//import SwiftUI
//
//enum Tabs: Int {
//    case overview = 0
//    case news = 1
//    case videos = 2
//}
//
//struct Overview: View {
//    @State private var selectedTab: Tabs = .overview
//    
//    var body: some View {
//        VStack {
//            if selectedTab == .overview {
//                OverviewView()
//            } else if selectedTab == .news {
//                NewsView()
//            } else if selectedTab == .videos {
//                VideoView()
//            }
//            Spacer()
//            CustomTabBar(selectedTab: $selectedTab)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview()
//    }
//}

