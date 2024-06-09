//
//  Electric.swift
//  Sthor
//
//  Created by Anh Cao on 9.6.2024.
//

import Foundation

let BASE_URL = "http://18.196.26.135"
let ELECTRIC_SERVICE = "/stormbreaker"
let CURRENT_EXCHANGE_PRICES = "/v1/market-price/today-tomorrow"

func GetCurrentExchangePrices() {
    guard let url = URL(string: BASE_URL + ELECTRIC_SERVICE + CURRENT_EXCHANGE_PRICES) else {
        print("Invalid URL")
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"  // optional
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
        if let error = error {
            print("Error while fetching data:", error)
            return
        }
        
        guard let data = data else {
            return
        }

        do {
            let response = try JSONDecoder().decode(TodayTomorrowPrices.self, from: data)
            print("response", response)
        } catch let jsonError {
            print("Failed to decode json", jsonError)
        }
    }
    task.resume()
}
