//
//  Electric.swift
//  Sthor
//
//  Created by Anh Cao on 9.6.2024.
//

import Foundation

class ElectricService {
    let BASE_URL = "http://18.196.26.135"
    let ELECTRIC_SERVICE = "/stormbreaker"
    let CURRENT_EXCHANGE_PRICES = "/v1/market-price/today-tomorrow"
    
    func GetTodayTomorrowPrices(completion: @escaping(Result<TodayTomorrowPrices, Error>) -> Void) {

        guard let url = URL(string: BASE_URL + ELECTRIC_SERVICE + CURRENT_EXCHANGE_PRICES) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print("client error")
                print("Error while fetching data:", error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("server error")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(TodayTomorrowPrices.self, from: data)
                print("[electric service] fetch today & tomorrow price successfully")
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    

}
