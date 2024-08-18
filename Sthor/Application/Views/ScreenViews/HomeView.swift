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
    
    var body: some View {
        let header = Header( title: "Dashboard",
                             horizontalAlignment: .leading)
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
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
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // action
                        print("open edit modal")
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }

            }
        }
    }
}

#Preview {
    HomeView()
    
}
