//
//  TransactionList.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/17.
//

import SwiftUI

struct TransactionListView: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                //MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key){ month, transactions in
                    
                }
            }
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            NavigationView{
                TransactionListView()
            }
            NavigationView {
                TransactionListView()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}

