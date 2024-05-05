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
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        
                    } header: {
                        ScreenHeader(
                            header: Header(
                                title: "Dashboard",
                                subTitle: formatDate(date: currentDate), 
                                horizontalAlignment: .leading)
                        )
                    }
                }
                .padding(15)
            }
        }
    }
}

#Preview {
    HomeView()
}
