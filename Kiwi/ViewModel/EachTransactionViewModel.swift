//
//  EachTransactionViewModel.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/21.
//

import Foundation
import Firebase
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [EachTransaction]>
typealias TransactionPrefixSum = [(String, Double)]


class EachTransactionViewModel: ObservableObject{
    @Published var listOfTransactions = [EachTransaction]()
    
    private var cancellables = Set<AnyCancellable>()
    

    
    func getDataFirestore(){
        print("firestore called")
        //Get a reference to the database
        let db = Firestore.firestore()
        // Read the docs at a specific path
        db.collection("transactions").getDocuments { snapshot, error in
            // check for errors
            if error == nil{
                // No errors
                if let snapshot = snapshot{
                    
                    // update the list property in the main thread
                    DispatchQueue.main.async {
                        // Get all the docs and create EachTransactions
                        self.listOfTransactions = snapshot.documents.map { doc in
                            // Create an EachTransaction item for each document returned
                            return EachTransaction(id: doc.documentID, amount: doc["amount"] as? String ?? "",
                                                   category: doc["category"] as? String ?? "",
                                                   name: doc["name"] as? String ?? "", date: doc["date"] as? String ?? "")
                        }
                    }
                    
                }
            }
            else{
                // handle the error
            }
        }
    }
    
//    // Grouping by month
//
//    func groupTransactionByMonth() -> TransactionGroup{
//        guard !listOfTransactions.isEmpty else {return [:] }
//
//        let groupedTransactions = TransactionGroup(grouping: listOfTransactions) { $0.month }
//
//        return groupedTransactions
//
//    }
//
//    // Accumulatting the transactions
//
//    func accumulateTransactions() -> TransactionPrefixSum{
////        print("accumulateTransactions")
//        guard !listOfTransactions.isEmpty else {return [] }
//
//        let today = "02/18/2022".dateParsed()
//        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
//
////        print("dateInterval", dateInterval)
//
//        var sum: Double = .zero
//        var cumulativeSum = TransactionPrefixSum()
//
//        for date in stride(from: dateInterval.start, to: today, by: 60*60*24){
//            let dailyExpenses = listOfTransactions.filter{ $0.dateParsed == date && ($0.isExpense != nil) }
//            let dailyTotal = dailyExpenses.reduce(0) {$0 - $1.signedAmount}
//
//            sum += dailyTotal
//            sum = sum.roundTo2Digits()
//            cumulativeSum.append((date.formatted(), sum))
////            print(date.formatted(), "dailyTotal:", dailyTotal, "sum:", sum)
//        }
//
//        return cumulativeSum
//    }
}
