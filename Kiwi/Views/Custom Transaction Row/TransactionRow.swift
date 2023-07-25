//
//  TransactionRow.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/11.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
//    var transaction: Transaction
     var eachTransaction: EachTransaction
    
//    @ObservedObject var eachTransactionVM = EachTransactionViewModel()

    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: eachTransaction.icon), fontsize: 24, color: Color.icon)
                }
            
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .fill(Color.icon.opacity(0.3))
//                .frame(width: 44, height: 44)
//                .overlay {
//                    FontIcon.text(.awesome5Solid(code: eachTransaction.icon), fontsize: 24, color: Color.icon)
//                }
            
            VStack(alignment: .leading, spacing: 6) {
                //MARK: Transaction Merchant
//                Text(transaction.merchant)
//                    .font(.subheadline)
//                    .bold()
//                    .lineLimit(1)
                
                Text(eachTransaction.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //MARK: Transaction Category
//                Text(transaction.category)
//                    .font(.footnote)
//                    .opacity(0.7)
//                    .lineLimit(1)
                
                Text(eachTransaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction Date
//                Text(transaction.dateParsed, format: .dateTime.year().month().day())
//                    .font(.footnote)
//                    .foregroundColor(.secondary)
                
                Text(eachTransaction.date)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            VStack(spacing: 6){
                //MARK: Transaction amount
                Text("$" + eachTransaction.amount)
                    .bold()
//                    .foregroundColor(eachTransaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
                
                //MARK: Transaction Location
//                Text(transaction.location)
            }

            
        }
        .padding([.top, .bottom], 8)
    }
    

    
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        
        TransactionRow(eachTransaction: transactionPreviewData)
        TransactionRow(eachTransaction: transactionPreviewData)
            .preferredColorScheme(.dark)
    }
}
