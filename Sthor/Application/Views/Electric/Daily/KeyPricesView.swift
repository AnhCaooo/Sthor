//
//  KeyPricesView.swift
//  Sthor
//
//  Created by Anh Cao on 11.7.2024.
//

import SwiftUI

struct KeyPricesView: View {
    var date: String
    var prices: PriceSeries
    
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
            // mark: only available for today view
            if Timer().isToday(dateString: date) {
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
    KeyPricesView(date: "2024-07-11" ,prices: samplePriceSeries)
}
