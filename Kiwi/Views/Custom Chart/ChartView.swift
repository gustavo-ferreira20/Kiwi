//
//  ChartView.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/7/31.
//

import SwiftUI
import SwiftUICharts


struct ChartView: View {

    @ObservedObject var eachTransactionVM = EachTransactionViewModel()
    @State private var isShareSheetPresented = false
    @State private var stringData = ""


    var body: some View {
        //MARK: Chart
        let data = eachTransactionVM.getCumulativeSumData()
        if !data.isEmpty{
            let totalExpenses = data.last

            CardView {
                VStack(alignment: .leading){
                    HStack{
                        ChartLabel(totalExpenses!.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                        Spacer()
                        Button(action: {
                            // Code to be executed when the button is tapped
                            stringData = "My current balance is: \(totalExpenses ?? 0.0)"
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
                }
                .background(Color.systemBackground)

            }
            .data(data)
            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
            .frame(height: 300)
        }
    }

    init(){
        eachTransactionVM.getDataFirestore()
    }
}


struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
