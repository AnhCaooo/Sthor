//
//  DailyPriceSubView.swift
//  Sthor
//
//  Created by Anh Cao on 25.6.2024.
//

import SwiftUI

struct DailyPriceSubView: View {
    @ObservedObject public var viewModel: CurrentPriceViewModel
    
    var body: some View {
        if let prices = viewModel.currentPrices {
            VStack {
                HStack {
                    Text("Today")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                AdvancedBarChart(data: prices.today.prices)
                    .frame(height: 300)
                    .padding(.top, 20)
                Divider()
                
                VStack{
                    HStack {
                        Text("Key Price Points")
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    // mark: only available for today view
                    GroupBox(
                        label: Label("Price now", systemImage: "")
                            .foregroundColor(.blue)
                        ) {
                            Text("Current price is 0.00 c/kwh")
                        }
                    
                    GroupBox(
                        label: Label("Daily average", systemImage: "")
//                            .foregroundColor(.blue)
                        ) {
                            Text("Average price is 0.00 c/kwh")
                        }
                    HStack{
                        GroupBox(
                            label: Label("Lowest", systemImage: "")
                                .foregroundColor(.green)
                            ) {
                                Text("0.00 c/kwh")
                            }
                        GroupBox(
                            label: Label("Highest", systemImage: "")
                                .foregroundColor(.red)
                            ) {
                                Text("0.00 c/kwh")
                            }
                    }
                    
                }
                .padding(.top, 20)
                
            }
            
        }
        
    }
}

#Preview {
    DailyPriceSubView(viewModel: CurrentPriceViewModel())
}
