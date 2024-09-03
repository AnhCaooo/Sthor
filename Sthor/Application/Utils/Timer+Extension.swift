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
    
    func getDateString(receivingDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let targetDate = dateFormatter.date(from: receivingDate) else {
            return "Invalid date"
        }
        
        let calendar = Calendar.current
        
        // Check if the target date is today, tomorrow, or yesterday
        if calendar.isDateInToday(targetDate) {
            return "Today"
        } else if calendar.isDateInTomorrow(targetDate) {
            return "Tomorrow"
        } else if calendar.isDateInYesterday(targetDate) {
            return "Yesterday"
        } else {
            // Return the formatted date string for other cases
            return dateFormatter.string(from: targetDate)
        }

    }
    
    func isTargetTimeLargerThanTomorrow(receivingDate: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
            
        guard let targetDate = dateFormatter.date(from: receivingDate) else {
            return false // Assuming we return `false` on invalid date instead of `true`
        }
            
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
            
        // Adding one day to today to get tomorrow's date
        guard let tomorrow = calendar.date(byAdding: .day, value: 1, to: today) else {
            return false // Fail-safe
        }
            
        // Check if targetDate is later than tomorrow
        return targetDate > tomorrow
    }
}
