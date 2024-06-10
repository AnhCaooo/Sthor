//
//  CurrentPriceViewModel.swift
//  Sthor
//
//  Created by Anh Cao on 9.6.2024.
//

import Foundation
import Combine

class CurrentPriceViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    @Published var currentPrices: TodayTomorrowPrices? = nil
    @Published var errorMessage: String = ""
    @Published var currentPriceState: NetworkState = .loading
    
    
    private let electricService = ElectricService()
        
    init() {
        getTodayTomorrowPrices()
    }
    
    func getTodayTomorrowPrices() {
        currentPriceState = .loading
        electricService.GetTodayTomorrowPrices()
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(err) = completion {
                    self?.errorMessage = err.localizedDescription
                    self?.currentPriceState = .failure
                }
            }, receiveValue: { [weak self] (receivedValue: TodayTomorrowPrices) in
                self?.currentPrices = receivedValue
                self?.currentPriceState = .success
            })
            .store(in: &cancellables)
    }
    
    // find and return price based on curret time with time format "yyyy-MM-dd HH:00:00".
    // The above format helps to filter out and get the price of current time slot from given data which has similar format
    func getCurrentPrice(todayPrices: PriceSeries) -> String {
        var currentPrice = "n/a"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:00:00"
        
        let currentTimeInString = formatter.string(from: Date())
        
        if let filteredData = todayPrices.data.first(where: { $0.time == currentTimeInString}) {
            
            currentPrice = String(format: "%.2f", filteredData.price)
        }
        return currentPrice
    }
}
