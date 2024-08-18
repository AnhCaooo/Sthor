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
                if viewModel.networkState == .loading {
                    SpinnerView(title: "Loading . . .")
                }
                ElectricDetailsView(viewModel: viewModel, group: .hour)
                    .disabled(viewModel.networkState == .success ? false : true)
                
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
