//
//  MiniBarChart.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts

struct MiniBarChart: View {
    var receivedData: PriceSeries
    
    var body: some View {
        // TODO: any ways to optimize these declarations?
        let unit = receivedData.name
        let dataSeries = receivedData.data
        
        Chart(dataSeries) {
            BarMark(x: .value("Hour", getHourFromStringToDate(dateString: $0.origTime)),
                    y: .value("Price", $0.price)
            )
            // MARK: Learn how to make the opacity change dynamically. The higher price, the darken color
//            .opacity(0)
            .accessibilityLabel("Exchange price at \($0.origTime)")
            .accessibilityValue("\($0.price) \(unit)")
        }
        .chartPlotStyle { chartContent in
            chartContent
                .background(Color.secondary.opacity(0.1))
        }
        .chartYScale(domain: [0, 30])
        .chartYAxis(.hidden)
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
        .padding()
    }
}

struct MiniBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        MiniBarChart(receivedData: electricResponsePreviewData.data.series[0])
    }
}
