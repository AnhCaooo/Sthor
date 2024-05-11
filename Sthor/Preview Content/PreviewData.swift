//
//  PreviewData.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//
import Foundation
import SwiftUI

let samplePriceSeries = PriceSeries(
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

let electricResponsePreviewData = PriceResponse(
    status: "success",
    data: PriceData(
        group: "hour",
        series: [PriceSeries](repeating: samplePriceSeries, count: 1)
    )
)
