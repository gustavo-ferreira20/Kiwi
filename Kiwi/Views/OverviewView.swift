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
    @ObservedObject var eachTransactionVM = EachTransactionViewModel()
    
    @State private var isModalPresented = false
    @State private var isDataSaved = false
    


    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()

                    //MARK: Chart
                    
                    
                    ChartView(eachTransactionVM: eachTransactionVM, data: eachTransactionVM.getCumulativeSumData(), totalExpenses: eachTransactionVM.chartLabel())
                        .id(eachTransactionVM.chartLabel())
                   

                    //MARK: Transaction List
                    
                    RecentTransactionList(transactions: eachTransactionVM.listOfTransactions)


                }
                .padding()
                .frame(maxWidth: .infinity)
                .onAppear(){
                    
                    eachTransactionVM.getDataFirestore()
                    UIApplication.shared.applicationIconBadgeNumber = 0
                    
                }
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
                        AddDataView(isDataSaved: $isDataSaved)

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
        .onChange(of: isDataSaved) { newValue in
            if newValue{
                eachTransactionVM.getDataFirestore()
                isDataSaved = false
            }
        }

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




