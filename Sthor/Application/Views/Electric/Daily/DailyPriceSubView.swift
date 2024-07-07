//
//  DailyPriceSubView.swift
//  Sthor
//
//  Created by Anh Cao on 25.6.2024.
//

import SwiftUI

struct DailyPriceSubView: View {
    @ObservedObject public var viewModel: CurrentPriceViewModel
    
    var body: some View {
        if let prices = viewModel.currentPrices {
            let currentPrice: String = "0.00"
            let averagePrice: String = "0.00"
            let lowestPrice: String = "0.00"
            let highestPrice: String = "0.00"
            let unit: String = prices.today.prices.name
            
            VStack {
                HStack {
                    Text("Today")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                AdvancedBarChart(data: prices.today.prices)
                    .frame(height: 300)
                    .padding(.top, 20)
                Divider()
                
                VStack{
                    HStack {
                        Text("Key Price Points")
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    // mark: only available for today view
                    PriceCardGroupBox(info: CardConfig(label: CardPriceLabel.now, icon: "", content: "Current price is \(currentPrice) \(unit)"))
                    PriceCardGroupBox(info: CardConfig(label: CardPriceLabel.average, icon: "", content: "Average price is \(averagePrice) \(unit)"))
                    HStack{
                        PriceCardGroupBox(info: CardConfig(label: CardPriceLabel.lowest, icon: "", content: "\(lowestPrice) \(unit)"))
                        PriceCardGroupBox(info: CardConfig(label: CardPriceLabel.highest, icon: "", content: "\(highestPrice) \(unit)"))
                    }
                    
                }
                .padding(.top, 20)
                
            }
            
        }
        
    }
}

#Preview {
    DailyPriceSubView(viewModel: CurrentPriceViewModel())
}
