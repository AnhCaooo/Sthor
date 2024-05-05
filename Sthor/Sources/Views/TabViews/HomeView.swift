//
//  HomeView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct HomeView: View {
    let header = Header(title: "Dashboard", subTitle: "4th May 2024")
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ScreenHeader(header: header)
                Spacer()
            }
            Spacer()
            Button("Button") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
