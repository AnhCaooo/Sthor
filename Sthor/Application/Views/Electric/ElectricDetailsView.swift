//
//  ElectricDetailsView.swift
//  Sthor
//
//  Created by Anh Cao on 18.8.2024.
//

import SwiftUI

struct ElectricDetailsView: View {
    @ObservedObject public var viewModel: MarketPriceViewModel
    var group: TimelyGroup
    
    var body: some View {
        if let prices = viewModel.prices {
            let priceData: PriceSeries = prices.data.series[0]
            VStack {
                AdvancedBarChart(data: prices.data.series[0])
                    .frame(height: 300)
                    .padding(.top, 20)
                Divider()
                KeyPricesView(prices: priceData, group: group)
            }
        }
    }
}

#Preview {
    ElectricDetailsView(viewModel: MarketPriceViewModel(), group: .hour)
}
