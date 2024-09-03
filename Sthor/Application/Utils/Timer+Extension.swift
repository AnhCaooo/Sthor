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
    
    // todo: currently, this only support for daily
    // bug… somehow 2 near date is not showing correct
    func getDateString(receivingDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let currentDateInString = dateFormatter.string(from: Date())
        guard let currentDate = dateFormatter.date(from: currentDateInString) else {
            return "Invalid date"
        }
        
        guard let targetDate = dateFormatter.date(from: receivingDate) else {
            return "Invalid date"
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: currentDate, to: targetDate)

        if components.year == 0 && components.month == 0 && components.day == 0 {
            return "Today"
        } else if components.year == 0 && components.month == 0 && components.day == 1 {
            return "Tomorrow"
        } else if components.year == 0 && components.month == 0 && components.day == -1 {
            return "Yesterday"
        } else {
            return dateFormatter.string(from: targetDate)
        }
    }
    
}
