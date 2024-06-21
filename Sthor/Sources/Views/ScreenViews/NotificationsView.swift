//
//  NotificationsView.swift
//  Sthor
//
//  Created by Anh Cao on 4.5.2024.
//

import SwiftUI

struct NotificationsView: View {
    let header = Header(title: "Notifications", horizontalAlignment: .leading)
     var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        Text("Hello, here is the list of your notifications that you set alarm for.")
                    } header: {
                        
                    }
                }
                .padding(15)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ScreenHeader(header: header)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // action
                        print("open popup modal to edit the notification settings")
                    } label: {
                       Text("Edit")
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
