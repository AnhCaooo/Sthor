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
                    // TODO: could it be more easy and direct if we just pass the data of specific day such as: today, yesterday, tomorrow instead of whole bunch of data
                    // TODO: we would display in the following logic. Always show today price as first chart. Then for second place, show text if there is no tomorrow's price yet. Otherwise show tomorrow price. The price of next day often available around 3pm. Shall we consider to polling the backend from 14:30 - 15:30 after every 10 minutes
                    MiniBarChart(receivedData: priceResponse.data.series[0])
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
