//
//  KiwiApp.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

import SwiftUI
import Firebase

@main
struct KiwiApp: App {
    
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



