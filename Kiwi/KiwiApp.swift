//
//  KiwiApp.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/4.
//

import SwiftUI

@main
struct KiwiApp: App {
    //doing api call for the transactions list
    @StateObject var transactionListVM = TransactionListViewModel() // Delete this after doing the CRUD
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM) // delete this after do the CRUD
        }
    }
}
