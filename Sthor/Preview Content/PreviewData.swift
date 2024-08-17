//
//  PreviewData.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//
import Foundation
import SwiftUI

// MARK: Price for 1 day that contains prices for 24 hours in a day
let samplePriceSeries = PriceSeries(
    name: "c/kWh",
    data: [
        TimelyData(utcTime: "2024-05-09 00:00:00", origTime: "2024-05-09 00:00:00", time: "2024-05-09 00:00:00", price: 17.39, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 01:00:00", origTime: "2024-05-09 01:00:00", time: "2024-05-09 01:00:00", price: 9.53, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 02:00:00", origTime: "2024-05-09 02:00:00", time: "2024-05-09 02:00:00", price: 5.9, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 03:00:00", origTime: "2024-05-09 03:00:00", time: "2024-05-09 03:00:00", price: 3.58, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 04:00:00", origTime: "2024-05-09 04:00:00", time: "2024-05-09 04:00:00", price: 3.18, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 05:00:00", origTime: "2024-05-09 05:00:00", time: "2024-05-09 05:00:00", price: 3.16, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 06:00:00", origTime: "2024-05-09 06:00:00", time: "2024-05-09 06:00:00", price: 3.17, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 07:00:00", origTime: "2024-05-09 07:00:00", time: "2024-05-09 07:00:00", price: 4.42, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 08:00:00", origTime: "2024-05-09 08:00:00", time: "2024-05-09 08:00:00", price: 12.02, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 09:00:00", origTime: "2024-05-09 09:00:00", time: "2024-05-09 09:00:00", price: 9.13, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 10:00:00", origTime: "2024-05-09 10:00:00", time: "2024-05-09 10:00:00", price: 4.8, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 11:00:00", origTime: "2024-05-09 11:00:00", time: "2024-05-09 11:00:00", price: 2.59, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 12:00:00", origTime: "2024-05-09 12:00:00", time: "2024-05-09 12:00:00", price: 2.59, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 13:00:00", origTime: "2024-05-09 13:00:00", time: "2024-05-09 13:00:00", price: 1.15, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 14:00:00", origTime: "2024-05-09 14:00:00", time: "2024-05-09 14:00:00", price: 0.63, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 15:00:00", origTime: "2024-05-09 15:00:00", time: "2024-05-09 15:00:00", price: 0.59, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 16:00:00", origTime: "2024-05-09 16:00:00", time: "2024-05-09 16:00:00", price: 0.59, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 17:00:00", origTime: "2024-05-09 17:00:00", time: "2024-05-09 17:00:00", price: 0.9, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 18:00:00", origTime: "2024-05-09 18:00:00", time: "2024-05-09 18:00:00", price: -20, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 19:00:00", origTime: "2024-05-09 19:00:00", time: "2024-05-09 19:00:00", price: 2.59, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 20:00:00", origTime: "2024-05-09 20:00:00", time: "2024-05-09 20:00:00", price: 1.53, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 21:00:00", origTime: "2024-05-09 21:00:00", time: "2024-05-09 21:00:00", price: 1.06, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 22:00:00", origTime: "2024-05-09 22:00:00", time: "2024-05-09 22:00:00", price: 0.85, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
        TimelyData(utcTime: "2024-05-09 23:00:00", origTime: "2024-05-09 23:00:00", time: "2024-05-09 23:00:00", price: 0.72, vatFactor: 1.24, isToday: true, includeVat: VAT.included),
    ]
)

let sameTomorrowPricesNotAvailable = PriceSeries(
    name: "c/kWh",
    data: []
)

let electricResponsePreviewData = PriceResponse(
    status: "success",
    data: PriceData(
        group: "hour",
        series: [PriceSeries](repeating: samplePriceSeries, count: 1)
    )
)

let sampleTodayPricesOnly = TodayTomorrowPrices(
    today: DailyPrice(
        available: true,
        prices: samplePriceSeries
    ),
    tomorrow: DailyPrice(
        available: false,
        prices: sameTomorrowPricesNotAvailable
    )
)
