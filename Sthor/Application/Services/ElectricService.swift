//
//  Electric.swift
//  Sthor
//
//  Created by Anh Cao on 9.6.2024.
//

import Foundation
import Combine


typealias TodayTomorrowPricePublisher = AnyPublisher<TodayTomorrowPrices, Error>

class ElectricService {
    let BaseURL = "http://18.196.26.135"
    let ElectricService = "/stormbreaker"
    let CurrentExchangePrices = "/v1/market-price/today-tomorrow"
    
    let backgroundQueue = DispatchQueue(label: "electric-service")
    
    func GetTodayTomorrowPrices() -> TodayTomorrowPricePublisher {
        
        guard let url = URL(string: BaseURL + ElectricService + CurrentExchangePrices) else {
            fatalError("Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .subscribe(on: backgroundQueue)
            .receive(on: DispatchQueue.main)
            .decode(type: TodayTomorrowPrices.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    

}
