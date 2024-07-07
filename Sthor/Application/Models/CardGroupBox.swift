//
//  CardGroupBox.swift
//  Sthor
//
//  Created by Anh Cao on 7.7.2024.
//

import Foundation
import SwiftUI

struct CardConfig: Identifiable {
    let id = UUID()
    let label: CardPriceLabel
    let icon: String
    let content: String
}

enum CardPriceLabel {
    case now
    case average
    case lowest
    case highest
    
    var displayedName: String {
        switch self {
        case .now:
            "Price now"
        case .average:
            "Price average"
        case .lowest:
            "Lowest"
        case .highest:
            "Highest"
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .now:
            .blue
        case .average:
            .black
        case .lowest:
            .green
        case .highest:
            .red
        }
    }
}
