//
//  CustomTabBar.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        
        HStack{
            Button {
                // Swicth to Overview
            } label: {
                VStack{
                    Image(systemName: "network")
                    Text("Overview")
                }
            }

        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
