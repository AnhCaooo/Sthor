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

struct PriceRequest: Codable {
    let startDate: String
    let endDate: String
    let marginal: Float64
    let group: String
    let vatIncluded: Int32
    let comparedToLastYear: Int32
}

struct TodayTomorrowPrices: Codable {
    let today: DailyPrice
    let tomorrow: DailyPrice
}

struct DailyPrice: Codable {
    let available: Bool
    let prices: PriceSeries
}

