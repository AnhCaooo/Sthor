//
//  MiniBarChart.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts

struct MiniBarChart: View {
    var receivedData: PriceResponse
    
    var body: some View {
        let dataSeries = receivedData.data.series[0].data
        
        Chart(dataSeries) {
            BarMark(x: .value("Hour", getHourFromStringToDate(dateString: $0.origTime)),
                    y: .value("Price", $0.price)
            )
            .accessibilityLabel("Exchange price at \($0.origTime)")
            .accessibilityValue("\($0.price) cents per kWh")
        }
        .chartPlotStyle { chartContent in
            chartContent
                .background(Color.secondary.opacity(0.1))
        }
        .chartYScale(domain: [0, 20])
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
        MiniBarChart(receivedData: electricResponsePreviewData)
    }
}
