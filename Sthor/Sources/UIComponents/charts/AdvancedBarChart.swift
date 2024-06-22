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
    var data: PriceSeries
    
    var body: some View {
        let unit = data.name
        let dataSeries = data.data
        
        Chart(dataSeries) {
            BarMark(x: .value("Hour", formatter.parseStringToDate(date: $0.origTime), unit: .hour),
                    y: .value("Price", $0.price)
            )
            .foregroundStyle(.green.opacity(0.8))
            .accessibilityLabel("Exchange price at \($0.origTime)")
            .accessibilityValue("\($0.price) \(unit)")
        }
        // TODO: mark the Y scale more dynamic
        .chartYScale(domain: [-5, 30])
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
        .chartPlotStyle { plotArea in
            plotArea.background(.barChart.opacity(0.02))
        }
        
    }
}

#Preview {
    AdvancedBarChart(data: sampleTodayPricesOnly.today.prices)
}
