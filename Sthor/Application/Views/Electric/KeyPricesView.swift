//
//  KeyPricesView.swift
//  Sthor
//
//  Created by Anh Cao on 11.7.2024.
//

import SwiftUI

struct KeyPricesView: View {
    var prices: PriceSeries
    var group: TimelyGroup
    
    var body: some View {
        let currentPrice: String = prices.getCurrentPrice()
        let averagePrice: String = prices.getAveragePrice()
        let lowestPrice: PriceAtTime = prices.getLowestPrice()
        let highestPrice: PriceAtTime = prices.getHighestPrice()
        let unit: String = prices.name
        
        VStack{
            HStack {
                Text("Key Price Points")
                    .foregroundStyle(.secondary)
                Spacer()
            }
            // mark: current price is only available for today and in hour view
            if prices.isTodayPrices() && group == .hour {
                PriceCardGroupBox(info: CardConfig(type: CardPriceType.now, label: "Price now" , content: "Current price is \(currentPrice) \(unit)"))
            }
            PriceCardGroupBox(info: CardConfig(type: CardPriceType.average, label: "Average price", content: "Average price is \(averagePrice) \(unit)"))
            HStack{
                PriceCardGroupBox(info: CardConfig(type: CardPriceType.lowest, label: "Lowest at \(lowestPrice.convertTimeToMeridian())", content: "\(lowestPrice.price) \(unit)"))
                PriceCardGroupBox(info: CardConfig(type: CardPriceType.highest, label: "Highest at \(highestPrice.convertTimeToMeridian())", content: "\(highestPrice.price) \(unit)"))
            }
            
        }
        .padding(.top, 20)
    }
}

#Preview {
    KeyPricesView(prices: samplePriceSeries, group: .hour)
}
