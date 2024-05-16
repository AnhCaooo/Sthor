//
//  MiniBarChart.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts
// todo: put the header of the bar chart
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
            .foregroundStyle(.barChart)
            .accessibilityLabel("Exchange price at \($0.origTime)")
            .accessibilityValue("\($0.price) \(unit)")
        }
        // TODO: mark the Y scale more dynamic
        .chartYScale(domain: [0, 30])
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
        .aspectRatio(16/9, contentMode: .fit)
        .padding()
    }
}


struct MiniBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        MiniBarChart(receivedData: electricResponsePreviewData.data.series[0])
    }
}
