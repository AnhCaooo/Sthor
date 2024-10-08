//
//  Electric.swift
//  Sthor
//
//  Created by Anh Cao on 9.5.2024.
//

import Foundation


// Electric price request
struct PriceRequest: Codable {
    let startDate: String
    let endDate: String
    let marginal: Float64
    let group: TimelyGroup
    let vatIncluded: Int32VAT
    let comparedToLastYear: ComparedToLastYear
    
    enum CodingKeys: String, CodingKey {
        case startDate = "starttime"
        case endDate = "endtime"
        case marginal = "marginal"
        case group
        case vatIncluded = "include_vat"
        case comparedToLastYear = "compare_to_last_year"
    }
    
}

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
    
    func isTodayPrices() -> Bool {
        let now: String = Timer().getCurrentTimeWithDateAndHourOnly()
        if let _ = data.first(where: {$0.time == now}) {
            return true
        }
        return false
    }
    func getCurrentPrice() -> String {
        let now: String = Timer().getCurrentTimeWithDateAndHourOnly()
        if let filteredData = data.first(where: {$0.time == now}) {
            return filteredData.parsePriceFromDoubleToString()
        }
        return "0.00"
    }
    
    func getLowestPrice() -> PriceAtTime {
        if let lowestPrice: TimelyData = data.min(by: { $0.price < $1.price}) {
            return PriceAtTime(price: lowestPrice.parsePriceFromDoubleToString(), time: lowestPrice.time)
        }
        return PriceAtTime(price: "0.0", time: "n/a")
    }
    
    func getHighestPrice() -> PriceAtTime {        
        if let highestPrice: TimelyData = data.max(by: { $0.price < $1.price}) {
            return PriceAtTime(price: highestPrice.parsePriceFromDoubleToString(), time: highestPrice.time)
        }
        return PriceAtTime(price: "0.0", time: "n/a")
    }
    
    func getAveragePrice() -> String {
        let sumOfPrices: Double = data.reduce(0, {$0 + $1.price})
        let averagePrice: Double = sumOfPrices / Double(data.count)
        return String(format: "%.2f", averagePrice)
    }
}

struct PriceAtTime: Codable {
    let price: String
    let time: String

    func convertTimeToMeridian() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let date = formatter.parseStringToDate(date: time)
        return formatter.string(from: date)
    }
}

// Single electric price unit response
struct TimelyData: Codable, Identifiable {
    let id = UUID()
    let utcTime, origTime, time: String
    let price: Double
    let vatFactor: Double
    let isToday: Bool
    let includeVat: VAT

    enum CodingKeys: String, CodingKey {
        case utcTime = "time_utc"
        case origTime = "orig_time"
        case vatFactor = "vat_factor"
        case time, price, isToday, includeVat
    }
    
    // Use to convert price from Doube to formatted string
    func parsePriceFromDoubleToString() -> String {
        return String(format: "%.2f", price)
    }
}

struct TodayTomorrowPrices: Codable {
    let today: DailyPrice
    let tomorrow: DailyPrice
}

struct DailyPrice: Codable {
    let available: Bool
    let prices: PriceSeries
}


