//
//  ElectricDetailsView.swift
//  Sthor
//
//  Created by Anh Cao on 18.8.2024.
//

import SwiftUI

struct ElectricDetailsView: View {
    @ObservedObject public var viewModel: MarketPriceViewModel
    var group: TimelyGroup
    
    @State private var currentTime: String = "2024-08-19"
    var body: some View {
        if let prices = viewModel.prices {
            let priceData: PriceSeries = prices.data.series[0]
            NavigationStack {
                VStack {
                    HStack {
                        Text(getDefaultTimeInString(group: group))
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    AdvancedBarChart(data: prices.data.series[0])
                        .frame(height: 300)
                        .padding(.top, 20)
                    Divider()
                    KeyPricesView(prices: priceData, group: group)
                    
                }
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            currentTime = decreaseDate(dateString: currentTime)
                            // print("get price from previous date", currentTime)
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                        Spacer()
                        Text(Timer().getDateString(dateString: currentTime))
                        Spacer()
                        Button {
                            currentTime = increaseDate(dateString: currentTime)
                            // print("get price from next date", currentTime)
                        } label: {
                            Image(systemName: "chevron.right")
                        }
                    }
                }
            }
        }
    }
}

extension ElectricDetailsView {
    func getDefaultTimeInString(group: TimelyGroup) -> String {
        var time: String = "n/a"
        switch group {
        case .hour:
            time = "Today"
        case .weekly:
            time = "This week"
        case .monthly:
            time = "This month"
        default:
            time = ""
        }
        return time
    }
    func increaseDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return dateString
        }
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .day, value: 1, to: date)
        return dateFormatter.string(from: newDate!)
    }

    func decreaseDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return dateString
        }
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: .day, value: -1, to: date)
        return dateFormatter.string(from: newDate!)
    }
}
#Preview {
    ElectricDetailsView(viewModel: MarketPriceViewModel(), group: .hour)
}
