//
//  SpinnerView.swift
//  Sthor
//
//  Created by Anh Cao on 9.6.2024.
//

import SwiftUI

struct SpinnerView: View {
    let title: String
    
    let tintColor: Color = .blue
    let scaleSize: CGFloat = 1.0
    var body: some View {
        ProgressView() {
            Text(title)
        }
          .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
          .scaleEffect(scaleSize, anchor: .center)
    }
}

#Preview {
    SpinnerView(title: "Loading...")
}
