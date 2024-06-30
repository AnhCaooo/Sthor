//
//  FeaturesView.swift
//  Sthor
//
//  Created by Anh Cao on 30.6.2024.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        VStack {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
            
            FeatureCard(iconName: "chart.bar.xaxis.ascending.badge.clock",
                        description: "Get visualization view about exchange electric price in Finland")
            FeatureCard(iconName: "bell.and.waves.left.and.right.fill",
                        description: "Get notifications when tomorrow's exchange prices are available")
            FeatureCard(iconName: "apps.iphone",
                        description: "View price status via Widget without opening the app")
        }
        .padding()
    }
}

#Preview {
    FeaturesView()
}

