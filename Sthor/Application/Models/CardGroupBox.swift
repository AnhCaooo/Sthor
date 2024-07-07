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
    let type: CardPriceType
    let label: String
    let icon: String
    let content: String
}

enum CardPriceType {
    case now
    case average
    case lowest
    case highest
        
    var foregroundColor: Color {
        switch self {
        case .now:
            .blue
        case .average:
            .gray
        case .lowest:
            .green
        case .highest:
            .red
        }
    }
}
