//
//  Date+Extensions.swift
//  Sthor
//
//  Created by Anh Cao on 5.5.2024.
//

import Foundation

extension DateFormatter {
    func formatDateToString(date: Date, format: String? = "EEEE, d'th' MMMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func parseStringToDate(date: String) -> Date {
        let formatter = DateFormatter()
        // Set the date format string (check and compare the format with backend)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // convert string to a Date object
        guard let date = formatter.date(from: date) else {
            // Handle the case where the date string could not be parsed
            print("Error: Invalid date format")
            exit(0)
        }
        
        return date
    }
}
