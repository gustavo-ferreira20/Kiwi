//
//  ContentView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

import SwiftUI


struct Overview: View {
    
    @State var selectedTab: Tabs = .overview
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}
