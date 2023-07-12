//
//  TransactionListViewModel.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/11.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject{
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getTransactions()
    }
    
    func getTransactions(){
      guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print("Error fetching transactions", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
                return
            } receiveValue: {[weak self] result in
                self?.transactions = result                
            }
            .store(in: &cancellables)

    }
}



/*
 extension Category{
     static let autoAndTransport = Category(id: 1, name:"Auto & Transport", icon: .car_alt)
     static let billsAndUtilities = Category(id: 2, name:"Bills & Utilities", icon:.file_invoice_dollar)
     static let entertainment = Category(id: 3, name:"Entertainment", icon:.film)
     static let feesAndCharges = Category(id: 4, name:"Fees & Charges", icon: .hand_holding_usd)
     static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: .hamburger)
     static let home = Category(id: 6, name:"Home", icon:.home)
     static let income = Category(id: 7, name:"Income", icon:.dollar_sign)
     static let shopping = Category(id: 8, name:"Shopping", icon:.shopping_cart)
     static let transfer = Category(id: 9, name:"Transfer", icon:.exchange_alt)
     
     static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
     static let taxi = Category(id: 102, name:"Taxi", icon: . taxi, mainCategoryId: 1)
     static let mobilePhone = Category(id: 201, name:"Mobile Phone", icon: .mobile_alt, mainCategoryId: 2)
     static let moviesAndDVDs = Category(id: 301, name:"Movies & DVDs", icon: .film, mainCategoryId: 3)
     static let bankFee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4)
     static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
     static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
     static let restaurants = Category(id: 502, name:"Restaurants", icon: .utensils, mainCategoryId: 5)
     static let rent = Category(id: 601, name:"Rent", icon: .house_user, mainCategoryId: 6)
     static let homeSupplies = Category(id: 602, name:"Home Supplies", icon: .lightbulb, mainCategoryId: 6)
     static let paycheque = Category(id: 701, name: "Paycheque", icon: .dollar_sign, mainCategoryId: 7)
     static let software = Category(id: 801, name:"Software", icon: .icons, mainCategoryId: 8)
     static let creditCardPavment = Category (id: 901, name:"Credit Card Pavment", icon:.exchange_alt, mainCategoryId: 9)
 }
 */
