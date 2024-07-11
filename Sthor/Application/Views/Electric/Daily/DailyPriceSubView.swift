//
//  DailyPriceSubView.swift
//  Sthor
//
//  Created by Anh Cao on 25.6.2024.
//

import SwiftUI

struct DailyPriceSubView: View {
    @ObservedObject public var viewModel: MarketPriceViewModel
    
    var body: some View {
        if let prices = viewModel.prices {
            let priceData: PriceSeries = prices.data.series[0]
            
            VStack {
                HStack {
                    Text("Today")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                AdvancedBarChart(data: prices.data.series[0])
                    .frame(height: 300)
                    .padding(.top, 20)
                
                // todo
                HStack {
                    Button {
                        print("get price from previous date")
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                    Text("current day")
                    Spacer()
                    Button {
                        print("get price from following date but stop at tomorrow (disable)")
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }
                Divider()
                KeyPricesView(date: Timer().getCurrentDateOnly(), prices: priceData)
                
            }
            
        }
        
    }
}

#Preview {
    DailyPriceSubView(viewModel: MarketPriceViewModel())
}
