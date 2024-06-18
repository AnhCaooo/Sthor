//
//  HomeView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var currentDate = Date()
    let formatter = DateFormatter()
    let header = Header(title: "Dashboard", horizontalAlignment: .leading)
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 24) {
                    // MARK: Current exchange price chart
                    CurrentPriceView()
                    
                    // MARK: Electric situation in Finland/ countries
                    
                    // MARK: Insights view of electric usage
                    
                    // MARK: Asking for feedback
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ScreenHeader(header: header)
                }
            }
        }
    }
}

#Preview {
    HomeView()
    
}
