//
//  CurrentPriceView.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI

struct CurrentPriceView: View {
    @StateObject var viewModel = CurrentPriceViewModel()
    
    var body: some View {
        GroupBox("Exchange price of electric now") {
            switch viewModel.currentPriceState {
            case .loading:
                SpinnerView(title: "Loading . . .")
            case .failure:
                Text(viewModel.errorMessage)
            case .success:
                PriceView(viewModel: viewModel)
            }
        }
    }
}

struct CurrentPriceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrentPriceView()
            CurrentPriceView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        
    }
}
