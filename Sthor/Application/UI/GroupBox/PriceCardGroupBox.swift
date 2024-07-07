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
            label: Label(info.label.displayedName, systemImage: info.icon)
                .foregroundColor(info.label.foregroundColor)
            ) {
                Text(info.content)
            }
    }
}

#Preview {
    PriceCardGroupBox(info: CardConfig(label: CardPriceLabel.now, icon: "", content: "Test content"))
}
