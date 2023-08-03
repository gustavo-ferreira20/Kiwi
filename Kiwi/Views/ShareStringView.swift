//
//  ShareStringView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/3.
//

import SwiftUI



import SwiftUI
//import UIActivityViewController

struct ShareStringView: UIViewControllerRepresentable {
    @Binding var stringData: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareStringView>) -> UIActivityViewController {
        let activityItems: [Any] = [stringData]
        return UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareStringView>) {
        // Nothing to update here
    }
}

