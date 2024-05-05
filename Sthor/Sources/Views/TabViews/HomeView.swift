//
//  HomeView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct HomeView: View {
    let header = Header(title: "Dashboard", subTitle: "4th May 2024", horizontalAlignment: .leading)
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        
                    } header: {
                        ScreenHeader(header: header)
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
