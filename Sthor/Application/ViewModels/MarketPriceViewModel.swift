//
//  MarketPriceViewModel.swift
//  Sthor
//
//  Created by Anh Cao on 9.7.2024.
//

import Foundation
import Combine

class MarketPriceViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var prices: PriceResponse? = nil
    @Published var errorMessage: String = ""
    @Published var networkState: NetworkState = .idle
    
    private let electricService = ElectricService()
    
    init() {
        let reqBody = PriceRequest(
            startDate: Timer().getCurrentDateOnly(),
            endDate: Timer().getCurrentDateOnly(),
            marginal: 0.59,
            group: .hour,
            vatIncluded: .included,
            comparedToLastYear: .notCompared
        )
        getMarketPrices(body: reqBody)
    }
    
    func getMarketPrices(body: PriceRequest) {
        networkState = .loading
        electricService.GetMarketPrice(reqBody: body)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(err) = completion {
                    self?.errorMessage = String(describing: err)
                    self?.networkState = .failure
                }
            }, receiveValue: { [weak self] (receivedValue: PriceResponse) in
                self?.prices = receivedValue
                self?.networkState = .success
            })
            .store(in: &cancellables)
    }
    
}
