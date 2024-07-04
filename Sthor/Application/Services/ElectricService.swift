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
    let BASE_URL = "http://18.196.26.135"
    let ELECTRIC_SERVICE = "/stormbreaker"
    let CURRENT_EXCHANGE_PRICES = "/v1/market-price/today-tomorrow"
    
    let backgroundQueue = DispatchQueue(label: "electric-service")
    
    func GetTodayTomorrowPrices() -> TodayTomorrowPricePublisher {
        
        guard let url = URL(string: BASE_URL + ELECTRIC_SERVICE + CURRENT_EXCHANGE_PRICES) else {
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
