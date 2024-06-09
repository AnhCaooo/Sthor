//
//  CurrentPriceViewModel.swift
//  Sthor
//
//  Created by Anh Cao on 9.6.2024.
//

import Foundation
import Combine

class CurrentPriceViewModel: ObservableObject {
    @Published var currentPrices: TodayTomorrowPrices? = nil
    private let electricService = ElectricService()
        
    init() {
        getCurrentExchangePrices()
    }
    
    func getCurrentExchangePrices() {
        electricService.GetTodayTomorrowPrices { result in
            switch result {
            case .success(let resp):
                self.currentPrices = resp
            case .failure(let error):
                print("fail to get today and tomorrow price. Error: ", error)
            }
        }
    }
}
