//
//  NotificationsView.swift
//  Sthor
//
//  Created by Anh Cao on 4.5.2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        let header = Header(title: "Notifications")
        VStack {
            ScreenHeader(header: header)
            Spacer()
            Text("Hello, here is the list of your notifications that you set alarm for.")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NotificationsView()
}
