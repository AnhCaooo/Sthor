//
//  ProfileView.swift
//  Sthor
//
//  Created by Anh Cao on 4.5.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
       let header = Header(title: "Profile", horizontalAlignment: .leading)
       NavigationStack {
           ScrollView(.vertical) {
               LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                   Section {
                       Text("Hello, welcome to your profile.")
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
           }
       }
   }
}

#Preview {
    ProfileView()
}
