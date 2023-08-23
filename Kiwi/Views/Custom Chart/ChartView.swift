//
//  ChartView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/31.
//

import SwiftUI
import SwiftUICharts


struct ChartView: View {

    @ObservedObject var eachTransactionVM: EachTransactionViewModel

    var data: [Double]
    var totalExpenses: Double

    @State private var isShareSheetPresented = false
    @State private var stringData = ""



    var body: some View {
        //MARK: Chart
        if !data.isEmpty{
            CardView {
                VStack(alignment: .leading){
                    HStack{
                        ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                        Spacer()
                        Button(action: {
                            // Code to be executed when the button is tapped
                            stringData = "My current balance is: \(totalExpenses )"
                            print(stringData)
                            isShareSheetPresented = true
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 20, height: 24)
                                .imageScale(.large)
                                .foregroundColor(Color.icon)
                        }
                    }
                    .padding(.trailing,10)
                    .sheet(isPresented: $isShareSheetPresented) {
                        ShareStringView(stringData: $stringData)
                    }

                    LineChart()
//                        .onAppear(){
//
//                        }
                }
                .background(Color.systemBackground)

            }
            .data(data)
            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
            .frame(height: 300)
            .onAppear {
                // Call the notification function when the view appears
                if eachTransactionVM.chartLabel() < 0.0{
                    eachTransactionVM.sendPushNotificationIfCumulativeSumIsNegative()
                }
            }
            .onChange(of: data) { _ in
                // Call the notification function when the chart data changes
//                eachTransactionVM.sendPushNotificationIfCumulativeSumIsNegative()
            }

        }
    }


}






//struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        let data: [Double] = [100, 200, 150, 300, 50] // Sample data for review
//        let expenses: Double = 10
//        ChartView(data: data, totalExpenses: expenses)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        let eachTransactionVM = EachTransactionViewModel() // Create an instance of the ViewModel
        
        let data: [Double] = [100, 200, 150, 300, 50] // Sample data for review
        let expenses: Double = 10
        eachTransactionVM.listOfTransactions = [ /* Add sample transactions here */ ]
        
        return ChartView(eachTransactionVM: eachTransactionVM, data: data, totalExpenses: expenses)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}










