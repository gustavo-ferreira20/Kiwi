//
//  AddDataView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/18.
//

import SwiftUI

struct AddDataView: View {
    @State private var value: Double = 0
    @State private var name: String = ""
    @State private var date: Date = Date()
    @State private var valueText: String = ""
    @State private var selectedCategory: String = categories[0]
    
    
    @ObservedObject var eachTransactionVM = EachTransactionViewModel()
    
    @State private var isSaved = false
    
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount")) {
                    TextField("Enter Amount", text: Binding(
                        get: { valueText },
                        set: { valueText = $0; value = Double($0) ?? 0 }
                    ))
                    .keyboardType(.decimalPad)
                }
                .onChange(of: valueText) { newValue in
                    // This closure is called whenever the valueText changes
                    if newValue == "" {
                        value = 0 // Clear the value when the user starts typing
                    }
                }
                
                Section(header: Text("Name")) {
                    TextField("Enter Name", text: $name)
                }
                
                Section(header: Text("Category")) {
//                    TextField("Enter Category", text: $category)
                    CategorySelectionView(selectedCategory: $selectedCategory)
                }
                
                Section(header: Text("Date")) {
                    DatePicker(selection: $date, displayedComponents: [.date]) {
                        Text("Date")
                    }
                }
            }
            .navigationBarTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                },
                trailing: Button(action: {
                    // Send Data to Firestore here
                    print("Value: \(value)")
                    print("Name: \(name)")
                    print("Category: \(selectedCategory)")
                    print("Date: \(date)")
                    print("Final new date String: \(date.formatted())")
                    print("new Double: \(value.doubleToString())")
                    
                    eachTransactionVM.addDataFirestore(amount: value.doubleToString(), category: selectedCategory, name: name, date: date.formatted(), systemDate: date)
                    //Clear the textfields
                    value = 0
                    name = ""
                                        
                    self.isSaved = true
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            )

        }
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView()
    }
}




