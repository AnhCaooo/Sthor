//
//  HomeView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var currentDate = Date()
    var body: some View {
        let formatter = DateFormatter()
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 24) {
                    // MARK: Title
                    ScreenHeader(
                        header: Header(
                            title: "Dashboard",
                            subTitle: formatter.formatDateToString(date: currentDate),
                            horizontalAlignment: .leading)
                    )
                    
                    // MARK: Current exchange price chart
                    CurrentPriceView()
                    
                    // MARK: Electric situation in Finland/ countries
                    
                    // MARK: Insights view of electric usage
                    
                    // MARK: Asking for feedback
                }
                .padding()

            }
        }
    }
}

#Preview {
    HomeView()
    
}
