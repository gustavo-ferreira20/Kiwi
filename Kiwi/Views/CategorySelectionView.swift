//
//  CategorySelectionView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/19.
//

import SwiftUI

let categories = ["Auto & Transport", "Bills & Utilities", "Entertainment", "Fees & Charges", "Food & Dining", "Home", "Income", "Shopping", "Transfer"]


struct CategorySelectionView: View {
    @State private var selectedCategoryIndex = 0 // Default selection -> set to 0 for the first category
    @Binding var selectedCategory: String

    var body: some View {
        VStack(alignment: .leading) {

            Menu {
                ForEach(0..<categories.count, id: \.self) { index in
                    Button(action: {
                        selectedCategoryIndex = index
                        selectedCategory = categories[index]
                    }) {
                        Text(categories[index])
                            .foregroundColor(Color.text)
                    }
                }
            } label: {
                HStack {
                    Text(categories[selectedCategoryIndex])
                    Spacer()
                    Image(systemName: "chevron.down")
                }
            }
        }
    }
}


