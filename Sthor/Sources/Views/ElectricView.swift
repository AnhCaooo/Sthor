//
//  ElectricView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct ElectricView: View {
    var body: some View {
        let header = Header(title: "Electric")
        VStack {
            ScreenHeader(header: header)
            Spacer()
            Text("Hello, this is advanced view for exchange electric price. Select specific timeslot to view electric")
            Spacer()
        }
    }
}

#Preview {
    ElectricView()
}
