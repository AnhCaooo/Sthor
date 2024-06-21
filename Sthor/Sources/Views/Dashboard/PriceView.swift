//
//  PriceView.swift
//  Sthor
//
//  Created by Anh Cao on 10.6.2024.
//

import SwiftUI

struct PriceView: View {
    @ObservedObject public var viewModel: CurrentPriceViewModel
    
    var body: some View {
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
                            .frame(height: 80)
                    } else {
                        // TODO: Consider for later if we decide to support different languages
                        HStack {
                            Text("Today's prices are not available yet")
                            Spacer()
                        }
                    }
                    
                    if prices.tomorrow.available {
                        MiniExchangePricesBarChart(data: prices.tomorrow.prices)
                            .frame(height: 80)
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
        }
    }
}

#Preview {
    PriceView(viewModel: CurrentPriceViewModel())
}
