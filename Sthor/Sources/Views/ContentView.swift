//
//  ContentView.swift
//  Sthor
//
//  Created by Anh Cao on 1.5.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case electric
        case notification
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            
            ElectricView()
                .tabItem{
                    Label("Electric", systemImage: "bolt")
                }
                .tag(Tab.electric)
            
            
            NotificationsView()
                .tabItem{
                    Label("Notifications", systemImage: "bell")
                }
                .tag(Tab.notification)
            
            
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
