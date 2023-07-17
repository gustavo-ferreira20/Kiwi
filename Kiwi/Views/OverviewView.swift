//
//  OverviewView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI

struct OverviewView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //Tittle
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
             // Add transaction button
                ToolbarItem{
                    Button(action: {
                        // Button action
//                        print("pressed")
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .imageScale(.large)
                    }
                    .symbolRenderingMode(.palette)
                    .foregroundColor(Color.icon)
                }

            }
        }
        .navigationViewStyle(.stack)
        
    }
}

struct OverviewView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            OverviewView()
            OverviewView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)

    }
        
}
