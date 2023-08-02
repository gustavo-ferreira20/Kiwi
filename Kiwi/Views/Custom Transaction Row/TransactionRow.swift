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
    

    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: eachTransaction.icon), fontsize: 24, color: Color.icon)
                }
            
            
            VStack(alignment: .leading, spacing: 6) {
                //MARK: Transaction Merchant
                
                Text(eachTransaction.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //MARK: Transaction Category
                
                Text(eachTransaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction Date
                
                Text(eachTransaction.date)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            VStack(spacing: 6){
                //MARK: Transaction amount
                Text("$" + eachTransaction.amount)
                    .bold()
                    .foregroundColor(eachTransaction.isExpense == true ? Color.red : .icon)
                
                //MARK: Transaction Location
                Text(eachTransaction.countryName.replacingOccurrences(of: eachTransaction.countryName, with: eachTransaction.countryName.emojiFlag(country: eachTransaction.countryName)))
                    .padding(5)
            

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
