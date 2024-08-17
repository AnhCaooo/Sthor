//
//  ElectricEnum.swift
//  Sthor
//
//  Created by Anh Cao on 10.7.2024.
//

import Foundation

enum TimelyGroup: String, Codable {
    case hour = "hour"
    case daily = "day"
    case weekly = "week"
    case monthly = "month"
    case yearly = "year"
}

enum VAT: String, Codable  {
    case included = "1"
    case notIncluded = "0"
}

enum ComparedToLastYear: Int32, Codable {
    case compared = 1
    case notCompared = 0
}
