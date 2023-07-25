//
//  TransactionList.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/17.
//

import SwiftUI

//struct TransactionListView: View {
//
////    @EnvironmentObject var eachTransactionVM: EachTransactionViewModel
//    @Environment(\.presentationMode) var presentationMode
//
//    @ObservedObject var eachTransactionVM = EachTransactionViewModel()
//
//    var body: some View {
//        VStack{
//            List{
//                //MARK: Transaction Groups
//                ForEach(Array(eachTransactionVM.groupTransactionByMonth()), id: \.key){ month, transactions in
//                    Section {
//                        //MARK: Transaction List
//                        ForEach(transactions) { transactions in
//                            TransactionRow(eachTransaction: transactions)
//                        }
//                    } header: {
//                        //MARK: Transaction Month
//                        Text(month)
//                    }
//                    .listSectionSeparator(.hidden)
//                }
//            }
//            .listStyle(.plain)
//        }
//        .navigationTitle("Transactions")
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: backButton)
//    }
//
//    var backButton: some View {
//        Button(action: {
//            // Pop the screen and go back to the previous one
//            presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack(spacing: 0) {
//                Image(systemName: "chevron.left")
//                    .imageScale(.large)
//                Text("") // Empty text to replace the "Back" title
//            }
//        }
//        .foregroundColor(.green)
//    }
//
//
//    init(){
//        eachTransactionVM.getDataFirestore()
//    }
//}
//
//struct TransactionList_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        Group{
//            NavigationView{
//                TransactionListView()
//            }
//            NavigationView {
//                TransactionListView()
//                    .preferredColorScheme(.dark)
//            }
//        }
//
//    }
//}


struct TransactionListView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var eachTransactionVM = EachTransactionViewModel()

    var body: some View {
        VStack {
            if eachTransactionVM.listOfTransactions.isEmpty {
                // Show a loading view or placeholder while the data is being fetched
                Text("Loading...")
            } else {
                List {
                    //MARK: Transaction Groups
                    ForEach(Array(eachTransactionVM.groupTransactionByMonth()), id: \.key) { month, transactions in
                        Section(header: Text(month)) {
                            //MARK: Transaction List
                            ForEach(transactions) { transaction in
                                TransactionRow(eachTransaction: transaction)
                            }
                        }
                        .listSectionSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .onAppear {
            eachTransactionVM.getDataFirestore()
        }
    }

    var backButton: some View {
        Button(action: {
            // Pop the screen and go back to the previous one
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 0) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                Text("") // Empty text to replace the "Back" title
            }
        }
        .foregroundColor(.green)
    }
}

struct TransactionList_Previews: PreviewProvider {

    static var previews: some View {
        Group {
                TransactionListView()
                TransactionListView()
                    .preferredColorScheme(.dark)
        }
    }
}
