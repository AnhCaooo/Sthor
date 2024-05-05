//
//  Ui.swift
//  Sthor
//
//  Created by Anh Cao on 5.5.2024.
//

import Foundation
import SwiftUI

struct Header: Identifiable {
    let id = UUID()
    let title: LocalizedStringKey
    let subTitle: LocalizedStringKey?
    let horizontalAlignment: Alignment
    let verticalAlignment: Alignment
    
    init(title: LocalizedStringKey, subTitle: LocalizedStringKey? = nil, horizontalAlignment: Alignment = .center, verticalAlignment: Alignment = .center) {
        self.title = title
        self.subTitle = subTitle
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
    }
}
