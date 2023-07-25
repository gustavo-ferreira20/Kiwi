//
//  OverviewView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/5.
//

import SwiftUI
import SwiftUICharts
import Firebase

struct OverviewView: View {
//    @EnvironmentObject var transactionListVM: TransactionListViewModel
//    @EnvironmentObject var eachTransactionVM: EachTransactionViewModel
    @ObservedObject var eachTransactionVM = EachTransactionViewModel()
    @State private var isModalPresented = false
    
        
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Chart
//                    let data = eachTransactionVM.accumulateTransactions()
//                    if !data.isEmpty{
//                        let totalExpenses = data.last?.1 ?? 0
//                        CardView {
//                            VStack(alignment: .leading){
//                                HStack{
//                                    ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
//                                    Spacer()
//                                    Button(action: {
//                                        // Code to be executed when the button is tapped
//                                        print("Button tapped! -- Balance Shared")
//                                    }) {
//                                        Image(systemName: "square.and.arrow.up")
//                                            .resizable()
//                                            .frame(width: 20, height: 24)
//                                            .imageScale(.large)
//                                            .foregroundColor(Color.icon)
//                                    }
//                                }
//                                .padding(.trailing,10)
//                                
//                                LineChart()
//                            }
//                            .background(Color.systemBackground)
//
//                        }
//                        .data(data)
//                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
//                        .frame(height: 300)
//                    }
                   
                    
                    //MARK: Transaction List
                    RecentTransactionList()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
             // Add transaction button
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        // Button action
                        isModalPresented = true
                    }) {
                            Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                .imageScale(.large)
                            
                    }
                    .sheet(isPresented: $isModalPresented) {
                        // Present the AddDataView using the sheet modifier
                        AddDataView()
                    }
                    .symbolRenderingMode(.palette)
                    .foregroundColor(Color.icon)
                }
        // Title
            ToolbarItem(placement: .principal) {
                Text("🥝")
                    .font(.title)
            }
            }
            
        }
        .navigationViewStyle(.stack)
    }

    
}

struct OverviewView_Previews: PreviewProvider {

    
    static var previews: some View {
        Group{
            OverviewView()
            OverviewView()
                .preferredColorScheme(.dark)
        }
        

    }
        
}
