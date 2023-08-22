//
//  RecentTransactionList.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/12.
//

import SwiftUI




struct RecentTransactionList: View {

    
    var transactions: [EachTransaction]

    var body: some View {
        VStack{
            HStack{
                //MARK: Header Title
                Text("Recent Transactions")
                    .bold()

                Spacer()

                //MARK: Header Link
                NavigationLink {
                    TransactionListView()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }

            }
            .padding(.top)

            //MARK: Recent Transactions List

            ForEach(Array(transactions.prefix(5).enumerated()), id: \.element.id) { index, transaction in
                TransactionRow(eachTransaction: transaction)


                Divider()
                    .opacity(index == 4 ? 0:1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)


    }
    
    
    
//    init(){
//        eachTransactionVM.getDataFirestore()
//    }

}



struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTransactions = [
            EachTransaction(id: "1", amount: "100", category: "Food", name: "Groceries", date: "2023-08-01", isExpense: true, systemDate: Date(), countryName: "United States"),
            EachTransaction(id: "2", amount: "50", category: "Entertainment", name: "Movies", date: "2023-08-02", isExpense: true, systemDate: Date(), countryName: "United States"),
            EachTransaction(id: "3", amount: "200", category: "Salary", name: "Monthly Income", date: "2023-08-03", isExpense: false, systemDate: Date(), countryName: "United States")
        ]

        Group {
            RecentTransactionList(transactions: sampleTransactions)
            RecentTransactionList(transactions: sampleTransactions)
                .preferredColorScheme(.dark)
        }
    }
}
