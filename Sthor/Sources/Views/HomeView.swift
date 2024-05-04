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
        VStack {
            VStack {
                HStack{
                    ScreenHeader(header: header)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
