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

struct TimelyData: Codable {
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

extension PriceResponse {
    static let samplePriceSeries = PriceSeries(
        name: "c/kWh",
        data: [
            TimelyData(origTime: "2024-05-09 00:00:00", time: "2024-05-09 00:00:00", price: 17.39, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 01:00:00", time: "2024-05-09 01:00:00", price: 9.53, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 02:00:00", time: "2024-05-09 02:00:00", price: 5.9, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 03:00:00", time: "2024-05-09 03:00:00", price: 3.58, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 04:00:00", time: "2024-05-09 04:00:00", price: 3.18, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 05:00:00", time: "2024-05-09 05:00:00", price: 3.16, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 06:00:00", time: "2024-05-09 06:00:00", price: 3.17, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 07:00:00", time: "2024-05-09 07:00:00", price: 4.42, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 08:00:00", time: "2024-05-09 08:00:00", price: 12.02, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 09:00:00", time: "2024-05-09 09:00:00", price: 9.13, vatFactor: 1, isToday: true),
            TimelyData(origTime: "2024-05-09 10:00:00", time: "2024-05-09 10:00:00", price: 4.8, vatFactor: 1, isToday: true),
        ]
    )
    static let sampleResponseData = PriceResponse(
        status: "success",
        data: PriceData(
            group: "hour",
            series: [
                samplePriceSeries,
            ]
        )
    )
}
