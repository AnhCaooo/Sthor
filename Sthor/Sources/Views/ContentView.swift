//
//  ContentView.swift
//  Sthor
//
//  Created by Anh Cao on 1.5.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    var tabHandler: Binding<Tab> { Binding(
            get: { self.selectedTab },
            set: { selectedTab in
                switch selectedTab {
                case .home:
                    print("Reset to home!!")
//                    withAnimation{
//                        
//                    }
                case .profile:
                    print("Reset to profile!!")
//                    withAnimation {
//                        
//                    }
                }
                
                // Make sure the new value is persisted.
                self.selectedTab = selectedTab
            }
        )}
    
    var body: some View {
        TabView(selection: tabHandler) {
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
