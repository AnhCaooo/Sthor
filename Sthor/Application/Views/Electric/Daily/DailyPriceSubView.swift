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
            VStack {
                AdvancedBarChart(data: prices.today.prices)
                    .frame(height: 300)
            }
            .padding()
        }
        
    }
}

#Preview {
    DailyPriceSubView(viewModel: CurrentPriceViewModel())
}
