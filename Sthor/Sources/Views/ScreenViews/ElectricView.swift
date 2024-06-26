//
//  ElectricView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct ElectricView: View {    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    DailyPriceView()
                }
            }
        }
        .navigationTitle("Electric")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ElectricView()
}
