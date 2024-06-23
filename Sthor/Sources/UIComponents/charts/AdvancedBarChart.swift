//
//  AdvancedBarChart.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts

struct AdvancedBarChart: View {
    var formatter = DateFormatter()
    /// Receiving parameter
    var electricResp: PriceSeries
    /// State properties
    @State private var chartSelection: Date?
    
    var body: some View {
        let unit = electricResp.name
        let dataSeries = electricResp.data
        
        Chart(dataSeries) {
            BarMark(
                x: .value("Hour", formatter.parseStringToDate(date: $0.origTime), unit: .hour),
                y: .value("Price", $0.price)
            )
            .foregroundStyle(.green.opacity(0.8))
            .accessibilityLabel("Exchange price at \($0.origTime)")
            .accessibilityValue("\($0.price) \(unit)")
            
            if let chartSelection {
                RuleMark(x: .value("Hour", chartSelection , unit: .hour))
                    .foregroundStyle(.gray.opacity(0.5))
                    .annotation(
                    position: 
                        .top,
                        overflowResolution: .init(x: .fit, y: .disabled)
                    ) {
                        ZStack {
                            Text("\(getPrice(date: chartSelection, data: dataSeries)) \(unit)")
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundStyle(Color.accentColor.opacity(0.2))
                        }
                    }
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .hour, count: 6)) { value in
                if let date = value.as(Date.self) {
                    let hour = Calendar.current.component(.hour, from: date)
                    AxisValueLabel(format: .dateTime.hour())
                    
                    if hour == 0 {
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 0))
                        AxisTick(stroke: StrokeStyle(lineWidth: 0.5))
                    } else {
                        AxisGridLine()
                        AxisTick()
                    }
                }
            }
        }
        .chartYScale(domain: -5 ... 50)
        .chartPlotStyle { plotArea in
            plotArea.background(.barChart.opacity(0.02))
        }
        .chartXSelection(value: $chartSelection)
        
    }
    
    func getPrice(date: Date, data: [TimelyData]) -> String {
        let receivedDate = formatter.formatDateToString(date: date, format: "yyyy-MM-dd HH:00:00")
        var price: Double = 0
        
        if let filteredData = data.first(where: {$0.time == receivedDate}) {
            price = filteredData.price
        }
        return String(format: "%.2f", price)
    }
}

#Preview {
    AdvancedBarChart(electricResp: sampleTodayPricesOnly.today.prices)
        .frame(height: 300)
}
