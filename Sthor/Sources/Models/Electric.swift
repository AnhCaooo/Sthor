//
//  Electric.swift
//  Sthor
//
//  Created by Anh Cao on 9.5.2024.
//

import Foundation

struct PriceResponse: Codable {
    let status: String
    let data: PriceData
}

struct PriceData: Codable {
    let group: String
    let series: [PriceSeries]
}

struct PriceSeries: Codable {
    let name: String
    let data: [TimelyData]
}

struct TimelyData: Codable, Identifiable {
    let id = UUID()
    let origTime, time: String
    let price: Double
    let vatFactor: Int
    let isToday: Bool

    enum CodingKeys: String, CodingKey {
        case origTime = "orig_time"
        case time, price
        case vatFactor = "vat_factor"
        case isToday
    }
}

struct PriceRequest {
    let startDate: String
    let endDate: String
    let marginal: Float64
    let group: String
    let vatIncluded: Int32
    let comparedToLastYear: Int32
}

struct TodayTomorrowPrices {
    let today: DailyPrice
    let tomorrow: DailyPrice
}

struct DailyPrice {
    let available: Bool
    let prices: PriceSeries
}


func getHourFromStringToDate(dateString: String) -> Date {
    let formatter = DateFormatter()
    // Set the date format string (check and compare the format with backend)
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    // convert string to a Date object
    guard let date = formatter.date(from: dateString) else {
        // Handle the case where the date string could not be parsed
        print("Error: Invalid date format")
        exit(0)
    }
    
    return date
}
