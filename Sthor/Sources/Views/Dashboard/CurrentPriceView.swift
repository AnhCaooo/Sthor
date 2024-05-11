//
//  CurrentPriceView.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI

struct CurrentPriceView: View {
    let priceResponse: PriceResponse = electricResponsePreviewData
    var body: some View {
        VStack {
            HStack{
                Text("Exchange price of electric now")
                Spacer()
            }
            Spacer()
            HStack {
                // TODO: get the current price at the time user open this application
                VStack {
                    Text("0.05")
                        .font(.title)
                        .bold()
                    Text(priceResponse.data.series[0].name)
                }
                Spacer()
                VStack{
                    MiniBarChart(receivedData: electricResponsePreviewData)
                    // TODO: put the conditions here to show tomorrow electric price if it is available, otherwise, display that tomorrow's price is not available yet
                    Text("Tomorrow's prices are not available yet")
                }
                
            }
            .font(.caption)
        }
        .padding()
        
        
    }
}

struct CurrentPriceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrentPriceView()
            CurrentPriceView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        
    }
}
