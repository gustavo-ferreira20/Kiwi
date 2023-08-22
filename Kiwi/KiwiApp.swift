//
//  KiwiApp.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

import SwiftUI
import Firebase
import UserNotifications

@main
struct KiwiApp: App {
    
    init(){
        FirebaseApp.configure()
        
        // Request notification authorization
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            } else {
                print("Notification authorization granted.")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



