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
import CoreLocation
import UserNotifications

typealias TransactionGroup = OrderedDictionary<String, [EachTransaction]>
//typealias TransactionPrefixSum = [(String, Double)]


class EachTransactionViewModel: ObservableObject{

    @Published var listOfTransactions = [EachTransaction]()
    private var locationViewModel = LocationViewModel()
    


    // Function to delete a transaction from Firestore
    func deleteDataFirestore(eachTransactionToDelete: EachTransaction) {
        // Get a reference to the database
        let db = Firestore.firestore()

        // Specify the doc to delete
        db.collection("transactions").document(eachTransactionToDelete.id).delete { error in
            if let error = error {
                // Handle the error
                print("Error deleting document: \(error.localizedDescription)")
            } else {
                // Delete successful, update the local list after deletion
                DispatchQueue.main.async {
                    self.listOfTransactions.removeAll { $0.id == eachTransactionToDelete.id }
                    self.getDataFirestore()
                    self.objectWillChange.send()
                }
            }
        }
        

        
    }


    func addDataFirestore(amount: String, category: String, name: String, date: String, isExpense: Bool ,systemDate: Date, countryName: String){
        //Get a reference to the database
        let db = Firestore.firestore()

        // Add a document to a collection
        db.collection("transactions").addDocument(data: ["amount": amount, "category": category, "name": name, "date": date,"isExpense": isExpense ,"systemDate": systemDate, "countryName": countryName]) { error in
            // check for errors
            if error == nil{
                // No errors
                
                // Call getDataFirestore to retrieve latest data
                self.getDataFirestore()
                self.objectWillChange.send()
            }
            else{
                //Handle the error
            }
        }
    }


    func getDataFirestore(){
        //Get a reference to the database
        let db = Firestore.firestore()
        // Read the docs at a specific path
        db.collection("transactions")
            .order(by: "systemDate", descending: true)
            .getDocuments { snapshot, error in
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
                                                   name: doc["name"] as? String ?? "", date: doc["date"] as? String ?? "", isExpense: doc["isExpense"] as? Bool ?? false, systemDate: Date(), countryName: doc["countryName"] as? String ?? "")

                        }
                        
                    }

                }
            }
            else{
                // handle the error
            }
        }
    }

    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        // Set the locale to adjust the formatting based on a specific region/language
         dateFormatter.locale = Locale(identifier: "en_US")

        return dateFormatter.string(from: date)
    }

    // Grouping by month

    func groupTransactionByMonth() -> TransactionGroup{
        guard !listOfTransactions.isEmpty else {return [:] }

        let groupedTransactions = TransactionGroup(grouping: listOfTransactions) { $0.month }

        return groupedTransactions

    }


    func isExpense(category: String) -> Bool{
        var isExpense = Bool()

        if category != "Income"{
            isExpense = true
            return isExpense
        }
        else{
            isExpense = false
            return isExpense
        }

    }

    // Addinng the sign in fron of each amount
    func signedAmount(isExpense: Bool, value: Double) -> Double{
        return isExpense ? -value : value
    }


    // Calculate the cumulative sum of transaction amounts
    func getCumulativeSumData() -> [Double] {
        let sortedTransactions = listOfTransactions.sorted { $0.systemDate < $1.systemDate }
        var cumulativeSum = 0.0
        var cumulativeSumData = [Double]()

        for transaction in sortedTransactions {
            let signedAmount = self.signedAmount(isExpense: transaction.isExpense, value: transaction.amountDouble)
            if transaction.isExpense == true{
                cumulativeSum -= signedAmount
                cumulativeSumData.append(cumulativeSum)
            }
            else{
                cumulativeSum += signedAmount
                cumulativeSumData.append(cumulativeSum)
            }
        
        }

        return cumulativeSumData
    }
    
//    // Requesting authorization to display notifications
//    func requestAuthorization() {
//        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//            UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
//                if let error = error{
//                    print("ERROR: \(error)")
//                }
//                else{
////                    print("SUCCESS")
//                }
//            }
//        
//    }
    
//    ChartLabel value
    func chartLabel() -> Double{
        guard let chartLabelValue = getCumulativeSumData().last else { return 0.0 }
        return chartLabelValue
    }
    
  
    // Sending a notification
    
    func sendPushNotificationIfCumulativeSumIsNegative() {
        let chartLabelValue = chartLabel()

        if chartLabelValue < 0 {
            // Create a notification content
            let content = UNMutableNotificationContent()
            content.title = "🚨🚨 Your Balance is negative 🚨🚨"
            content.body = "Please check the News and Videos tab for help with your finances."
            content.sound = .default
            content.badge = 1

            // Create a trigger to show the notification immediately
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: "balanceNegative", content: content, trigger: trigger)

            // Add the request to the notification center
            let center = UNUserNotificationCenter.current()
            center.add(request) { error in
                if let error = error {
                    print("Error sending notification: \(error.localizedDescription)")
                }
            }
        }
        
    }

    
        


}




