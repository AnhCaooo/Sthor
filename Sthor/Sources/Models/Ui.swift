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
    
    init(title: LocalizedStringKey, subTitle: LocalizedStringKey? = nil) {
        self.title = title
        self.subTitle = subTitle
    }
}
