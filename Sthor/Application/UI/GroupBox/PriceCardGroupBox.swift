//
//  PriceCardGroupBox.swift
//  Sthor
//
//  Created by Anh Cao on 7.7.2024.
//

import SwiftUI

struct PriceCardGroupBox: View {
    var info: CardConfig
    var body: some View {
        GroupBox(
            label: Label(info.label, systemImage: info.icon)
                .foregroundColor(info.type.foregroundColor)
                .accessibilityLabel(info.label)
        ) {
            Text(info.content)
                .accessibilityValue(info.content)
        }
    }
}

#Preview {
    PriceCardGroupBox(info: CardConfig(type: CardPriceType.now, label: "Test label", icon: "", content: "Test content"))
}
