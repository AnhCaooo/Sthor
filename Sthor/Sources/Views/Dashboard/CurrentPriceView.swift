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

        GroupBox("Exchange price of electric now") {
            VStack{
                if let prices = viewModel.currentPrices {
                    HStack {
                        VStack {
                            VStack {
                                Text(viewModel.getCurrentPrice(todayPrices: prices.today.prices))
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
                } else {
                    SpinnerView(title: "Loading . . .")
                }
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
