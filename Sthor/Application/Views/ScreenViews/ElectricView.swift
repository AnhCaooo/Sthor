//
//  ElectricView.swift
//  Sthor
//
//  Created by Anh Cao on 3.5.2024.
//

import SwiftUI

struct ElectricView: View {    
    enum BarChartStyle: CaseIterable, Identifiable {
        case daily
        case custom
        
        var id: Self {self}
        var displayName: String {
            switch self {
            case .daily:
                "Daily"
            case .custom:
                "Custom"
            }
        }
    }
    
    @State private var selectedBarChartType: BarChartStyle = .daily
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    GroupBox  {
                        Picker("Bar Chart View", selection: $selectedBarChartType) {
                            ForEach(BarChartStyle.allCases) {
                                Text($0.displayName)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Divider()
                        switch selectedBarChartType {
                        case .daily:
                            DailyPriceView()                            
                        case .custom:
                            CustomPriceView()
                        }                        
                    }
                    
                }
                .padding()
            }
        }
        .navigationTitle("Electric")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ElectricView()
}
