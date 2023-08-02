//
//  RecentTransactionList.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/12.
//

import SwiftUI




struct RecentTransactionList: View {
//    @EnvironmentObject var transactionListVM: TransactionListViewModel

    @ObservedObject var eachTransactionVM = EachTransactionViewModel()

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

            ForEach(Array(eachTransactionVM.listOfTransactions.prefix(5).enumerated()),id: \.element ){ index,transaction in
                TransactionRow(eachTransaction: transaction)


                Divider()
                    .opacity(index == 4 ? 0:1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
//        .onAppear(){
//            eachTransactionVM.getDataFirestore()
//        }


    }
    
    
    
    init(){
        eachTransactionVM.getDataFirestore()
//        eachTransactionVM.fetchCountryNameForTransactions()
    }

}

struct RecentTransactionList_Previews: PreviewProvider {
    
    
    static var previews: some View {
        Group{
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(.dark)
        }
    }
}
