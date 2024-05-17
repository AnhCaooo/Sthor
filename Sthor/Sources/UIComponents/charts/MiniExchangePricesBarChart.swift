//
//  MiniBarChart.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts
// TODO: put the header of the bar chart
// TODO: handle value if it is too low (-200) or too hight (220)
struct MiniExchangePricesBarChart: View {
    var data: PriceSeries
    
    var body: some View {
        // TODO: any ways to optimize these declarations?
        let unit = data.name
        let dataSeries = data.data
        
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
        .chartPlotStyle { plotArea in
            plotArea.background(.barChart.opacity(0.05))
        }

    }
}


struct MiniBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        MiniExchangePricesBarChart(data: sampleTodayPricesOnly.today.prices)
            .frame(height: 50)
    }
}
