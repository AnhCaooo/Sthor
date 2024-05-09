//
//  NotificationsView.swift
//  Sthor
//
//  Created by Anh Cao on 4.5.2024.
//

import SwiftUI

struct NotificationsView: View {
     var body: some View {
        let header = Header(title: "Notifications", horizontalAlignment: .leading)
        NavigationStack {
            ScrollView(.vertical) {
                // MARK: Title
                ScreenHeader(header: header)
                    .padding()
                
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        Text("Hello, here is the list of your notifications that you set alarm for.")
                    } header: {
                        
                    }
                }
                .padding(15)
            }
        }
    }
}

#Preview {
    NotificationsView()
}
