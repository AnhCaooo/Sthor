//
//  ContentView.swift
//  Sthor
//
//  Created by Anh Cao on 1.5.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)            
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
                .tag(Tab.profile)
        }
    }
}

#Preview {
    ContentView()
}
