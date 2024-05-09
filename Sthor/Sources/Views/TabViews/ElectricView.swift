//
//  ElectricView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct ElectricView: View {
    var body: some View {
        let header = Header(title: "Electric", horizontalAlignment: .leading)
        NavigationStack {
            ScrollView(.vertical) {
                // MARK: Title
                ScreenHeader(header: header)
                    .padding()
                
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        Text("Hello, this is advanced view for exchange electric price. Select specific timeslot to view electric")
                    } header: {
                        
                    }
                }
                .padding(15)
            }
        }
    }
}

#Preview {
    ElectricView()
}
