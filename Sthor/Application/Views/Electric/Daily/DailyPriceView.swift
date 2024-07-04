//
//  DailyPriceView.swift
//  Sthor
//
//  Created by Anh Cao on 25.6.2024.
//

import SwiftUI

struct DailyPriceView: View {
    @StateObject var viewModel = CurrentPriceViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        
        switch viewModel.currentPriceState {
        case .failure:
            errorView
        default:
            DailyPriceSubView(viewModel: viewModel)
                .disabled(viewModel.currentPriceState == .success ? false : true)
            if viewModel.currentPriceState == .loading {
                SpinnerView(title: "Loading . . .")
            }
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
