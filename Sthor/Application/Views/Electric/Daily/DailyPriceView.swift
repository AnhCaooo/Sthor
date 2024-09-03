//
//  DailyPriceView.swift
//  Sthor
//
//  Created by Anh Cao on 25.6.2024.
//

import SwiftUI

struct DailyPriceView: View {
    @StateObject var viewModel = MarketPriceViewModel()
    
    @State private var currentTime: String = Timer().getCurrentDateOnly()
    var body: some View {
        let _ = Self._printChanges()
        
        NavigationStack {
            VStack {
                switch viewModel.networkState {
                case .failure:
                    errorView
                default:
                    if viewModel.networkState == .loading {
                        SpinnerView(title: "Getting price . . .")
                    } else {
                        DetailsDailyView(viewModel: viewModel, group: .hour)
                            .disabled(viewModel.networkState == .success ? false : true)
                    }
                }
            }
            .onAppear {
                let reqBody = PriceRequest(
                    startDate: currentTime,
                    endDate: currentTime,
                    marginal: 0.59,
                    group: .hour,
                    vatIncluded: .included,
                    comparedToLastYear: .notCompared
                )
                viewModel.getMarketPrices(body: reqBody)
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        currentTime = decreaseDate(dateString: currentTime)
                        print("get price from previous date", currentTime)
                        let reqBody = PriceRequest(
                            startDate: currentTime,
                            endDate: currentTime,
                            marginal: 0.59,
                            group: .hour,
                            vatIncluded: .included,
                            comparedToLastYear: .notCompared
                        )
                        viewModel.getMarketPrices(body: reqBody)
                        
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                    Text(Timer().getDateString(dateString: currentTime))
                    Spacer()
                    Button {
                        currentTime = increaseDate(dateString: currentTime)
                        print("get price from next date", currentTime)
                        let reqBody = PriceRequest(
                            startDate: currentTime,
                            endDate: currentTime,
                            marginal: 0.59,
                            group: .hour,
                            vatIncluded: .included,
                            comparedToLastYear: .notCompared
                        )
                        viewModel.getMarketPrices(body: reqBody)
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
         
    }
    
    private var errorView: some View {
        VStack {
            Text(viewModel.errorMessage)
        }
    }
}

extension DailyPriceView {
    func increaseDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return dateString
        }
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .day, value: 1, to: date)
        return dateFormatter.string(from: newDate!)
    }

    func decreaseDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return dateString
        }
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .day, value: -1, to: date)
        return dateFormatter.string(from: newDate!)
    }
}
#Preview {
    DailyPriceView()
}
