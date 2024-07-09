//
//  Electric.swift
//  Sthor
//
//  Created by Anh Cao on 9.5.2024.
//

import Foundation

struct PriceRequest: Codable {
    let startDate: String
    let endDate: String
    let marginal: Float64
    let group: TimelyGroup
    let vatIncluded: VAT
    let comparedToLastYear: ComparedToLastYear
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

struct TimelyData: Codable, Identifiable {
    let id = UUID()
    let origTime, time: String
    let price: Double
    let vatFactor: VAT
    let isToday: Bool

    enum CodingKeys: String, CodingKey {
        case origTime = "orig_time"
        case time, price
        case vatFactor = "vat_factor"
        case isToday
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

enum TimelyGroup: String, Codable {
    case hour = "hour"
    case daily = "day"
    case weekly = "week"
    case monthly = "month"
    case yearly = "year"
}

enum VAT: Int32, Codable  {
    case included = 1
    case notIncluded = 0
}

enum ComparedToLastYear: Int32, Codable {
    case compared = 1
    case notCompared = 0
}
