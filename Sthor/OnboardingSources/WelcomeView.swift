//
//  WelcomeView.swift
//  Sthor
//
//  Created by Anh Cao on 30.6.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                        
                Image(systemName: "powercord.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
                
            Text("Welcome to MyElectric")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
                    
            Text("Visual exchange price")
                .font(.title2)
            }
            .padding()
    }
}

#Preview {
    WelcomeView()
}
