//
//  DailyPriceView.swift
//  Sthor
//
//  Created by Anh Cao on 25.6.2024.
//

import SwiftUI

struct DailyPriceView: View {
    @StateObject var viewModel = MarketPriceViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack{
            switch viewModel.networkState {
            case .failure:
                errorView
            default:
                DailyPriceSubView(viewModel: viewModel)
                    .disabled(viewModel.networkState == .success ? false : true)
                if viewModel.networkState == .loading {
                    SpinnerView(title: "Loading . . .")
                }
            }
        }
        .onAppear {
            let reqBody = PriceRequest(
                startDate: Timer().getCurrentDateOnly(),
                endDate: Timer().getCurrentDateOnly(),
                marginal: 0.59,
                group: .hour,
                vatIncluded: .included,
                comparedToLastYear: .notCompared
            )
            viewModel.getMarketPrices(body: reqBody)
        }
        
        
    }
    
    private var errorView: some View {
        VStack {
            Text(viewModel.errorMessage)
        }
    }
}

#Preview {
    DailyPriceView()
}
