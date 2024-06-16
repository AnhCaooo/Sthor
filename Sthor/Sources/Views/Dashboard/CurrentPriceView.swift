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
        let _ = Self._printChanges()
        NavigationLink(destination: ElectricView()) {
            GroupBox("Exchange price of electric now") {
                switch viewModel.currentPriceState {
                case .failure:
                    errorView
                default:
                    PriceView(viewModel: viewModel)
                        .disabled(viewModel.currentPriceState == .success ? false : true)
                    if viewModel.currentPriceState == .loading {
                        SpinnerView(title: "Loading . . .")
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        
    }
    
    private var errorView: some View {
        VStack {
            Text(viewModel.errorMessage)
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
