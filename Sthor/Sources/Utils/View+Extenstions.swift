//
//  View+Extenstions.swift
//  Sthor
//
//  Created by Anh Cao on 5.5.2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func horizontalSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func formatDate(date: Date, format: String? = "EEEE, d'th' MMMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
