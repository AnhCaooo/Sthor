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
    
    // Mark: consider to remove if this function is no longer used
    func isToday(dateString: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Check if the date string can be converted to a Date object
         guard dateFormatter.date(from: dateString) != nil else {
             print("Error: Invalid date format. Please use 'yyyy-MM-dd'.")
             return false
         }
        
        // Get the current date
        let currentDate = Date()
        // Get the current date string in the same format
        let currentDateString = dateFormatter.string(from: currentDate)
        
        // Compare the date strings
        return dateString == currentDateString
    }
}
