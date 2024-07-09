//
//  Time+Extension.swift
//  Sthor
//
//  Created by Anh Cao on 9.7.2024.
//

import Foundation

extension Timer {
    func getCurrentTimeWithDateAndHourOnly() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:00:00"
        return formatter.string(from: Date())
    }
    
    func getCurrentDateOnly() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}
