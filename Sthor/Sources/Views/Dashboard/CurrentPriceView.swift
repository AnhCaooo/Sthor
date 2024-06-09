//
//  CurrentPriceView.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI

struct CurrentPriceView: View {
//    let price: TodayTomorrowPrices = sampleTodayPricesOnly
    @StateObject var viewModel: CurrentPriceViewModel = CurrentPriceViewModel()
    
    var body: some View {
        VStack{
            if let prices = viewModel.currentPrices {
                GroupBox("Exchange price of electric now") {
                    HStack {
                        // TODO: get the current price at the time user open this application. Maybe just mapping the current time with the data got from backend is better than backend return this?
                        VStack {
                            VStack {
                                Text("0.05")
                                    .font(.title)
                                    .bold()
                                Text(prices.today.prices.name)
                            }
                            .frame(maxWidth: 100, alignment: .center)
                            
                        }
                        Spacer()
                        VStack{
                            // TODO: The price of next day often available around 3pm. Shall we consider to polling the backend from 14:30 - 15:30 after every 10 minutes
                            if prices.today.available {
                                MiniExchangePricesBarChart(data: prices.today.prices)
                                    .frame(height: 50)
                            } else {
                                // TODO: Consider for later if we decide to support different languages
                                HStack {
                                    Text("Today's prices are not available yet")
                                    Spacer()
                                }
                            }
                            
                            if prices.tomorrow.available {
                                MiniExchangePricesBarChart(data: prices.tomorrow.prices)
                                    .frame(height: 50)
                            } else {
                                // TODO: Consider for later if we decide to support different languages
                                HStack {
                                    Text("Tomorrow's prices are not available yet")
                                    Spacer()
                                }
                            }
                        }
                    }
                    .font(.caption)
                    .frame(maxHeight: 150)
                }
            } else {
                // todo: loading button
                Text("Price data not available yet")
            }
        }
        
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
