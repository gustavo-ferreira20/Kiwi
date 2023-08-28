//
//  VideoView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
//        Text("Videos View")
        NavigationView{
            VideoListView()
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}

