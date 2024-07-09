//
//  Electric.swift
//  Sthor
//
//  Created by Anh Cao on 9.6.2024.
//

import Foundation
import Combine


typealias TodayTomorrowPricePublisher = AnyPublisher<TodayTomorrowPrices, Error>
typealias MarketPricePublisher = AnyPublisher<PriceResponse, Error>

class ElectricService {
    let BaseURL = "http://18.196.26.135"
    let ElectricService = "/stormbreaker"
    let CurrentExchangePrices = "/v1/market-price/today-tomorrow"
    let MarketPrices = "/v1/market-price"
    
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
    
    
    func GetMarketPrice(reqBody: PriceRequest) -> MarketPricePublisher {
        guard let url = URL(string: BaseURL + ElectricService + MarketPrices) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
        do {
            request.httpBody = try JSONEncoder().encode(reqBody)
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .subscribe(on: backgroundQueue)
            .receive(on: DispatchQueue.main)
            .decode(type: PriceResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
