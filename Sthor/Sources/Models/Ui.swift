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
    let subTitle: String?
    let horizontalAlignment: Alignment
    let verticalAlignment: Alignment
    
    init(title: LocalizedStringKey, subTitle: String? = nil, horizontalAlignment: Alignment = .center, verticalAlignment: Alignment = .center) {
        self.title = title
        self.subTitle = subTitle
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
    }
}
