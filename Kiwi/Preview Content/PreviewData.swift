//
//  PreviewData.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/11.
//

import Foundation

// data with location included
//var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", location: "🇧🇷", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

//var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

//var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
//
var transactionPreviewData = EachTransaction(id: "1", amount: "30.45", category: "Shopping", name: "Carrefour", date: "20/07/2023")

var transactionListPreviewData = [EachTransaction](repeating: transactionPreviewData, count: 10)
