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
            let currentPrice: String = prices.today.prices.getCurrentPrice()
            let averagePrice: String = prices.today.prices.getAveragePrice()
            let lowestPrice: PriceAtTime = prices.today.prices.getLowestPrice()
            let highestPrice: PriceAtTime = prices.today.prices.getHighestPrice()
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
                    PriceCardGroupBox(info: CardConfig(type: CardPriceType.now, label: "Price now" , content: "Current price is \(currentPrice) \(unit)"))
                    PriceCardGroupBox(info: CardConfig(type: CardPriceType.average, label: "Average price", content: "Average price is \(averagePrice) \(unit)"))
                    HStack{
                        PriceCardGroupBox(info: CardConfig(type: CardPriceType.lowest, label: "Lowest at \(lowestPrice.convertTimeToMeridian())", content: "\(lowestPrice.price) \(unit)"))
                        PriceCardGroupBox(info: CardConfig(type: CardPriceType.highest, label: "Highest at \(highestPrice.convertTimeToMeridian())", content: "\(highestPrice.price) \(unit)"))
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
