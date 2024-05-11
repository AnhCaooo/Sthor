//
//  CardBackground.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI

// view modifier
struct CardBackground: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color("CardBackground"))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}


