//
//  OnboardingView.swift
//  Sthor
//
//  Created by Anh Cao on 30.6.2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            WelcomeView()
            FeaturesView()
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}
