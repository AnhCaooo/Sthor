//
//  ContentView.swift
//  Sthor
//
//  Created by Anh Cao on 1.5.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            
            NotificationsView()
                .tabItem{
                    Label("Notifications", systemImage: "bell")
                }
                .tag(Tab.notifications)
            
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
