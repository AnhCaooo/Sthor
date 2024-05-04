//
//  ProfileView.swift
//  Sthor
//
//  Created by Anh Cao on 4.5.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        let header = Header(title: "Profile")
        VStack {
            ScreenHeader(header: header)
            Spacer()
            Text("Hello, welcome to your profile.")
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
