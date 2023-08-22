//
//  TransactionData.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/8.
//

import Foundation

class TransactionData: ObservableObject {
    @Published var data: [Double] = [] 
    
    func addData(_ newData: Double) {
        data.append(newData)
    }
}
