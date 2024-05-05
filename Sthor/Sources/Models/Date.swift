//
//  Date.swift
//  Sthor
//
//  Created by Anh Cao on 5.5.2024.
//

import Foundation
import SwiftUI

struct DateFormatter {
    static func formatDate(date: Date, format: String? = "d'th'MMMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateS = format
        return formatter.string(from: date)
    }
}

