//
//  MiniBarChart.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts

// TODO: handle value if it is too low (-200) or too hight (220)
struct MiniExchangePricesBarChart: View {
    let formatter: DateFormatter
    /// Receiving parameter
    var data: PriceSeries
    /// Properties
    private var unit: String
    private var dataSeries: [TimelyData]
    
    init(data: PriceSeries) {
        self.data = data
        self.unit = data.name
        self.dataSeries = data.data
        self.formatter = DateFormatter()
    }
    
    var body: some View {
        let currentTime = formatter.getCurrentTimeWithDateAndHourOnly()

        let yValues = dataSeries.map { $0.price }
        let maxYValue = yValues.max() ?? 30
        let yDomain = 0...max(maxYValue, 30)
        
        Chart(dataSeries) {
            BarMark(x: .value("Hour", formatter.parseStringToDate(date: $0.origTime), unit: .hour),
                    y: .value("Price", $0.price)
            )
            .foregroundStyle(.green.opacity(0.8))
            .accessibilityLabel("Exchange price at \($0.origTime)")
            .accessibilityValue("\($0.price) \(unit)")
            
            if currentTime == $0.origTime {
                RectangleMark(x: .value("Hour", formatter.parseStringToDate(date: $0.origTime), unit: .hour))
                    .foregroundStyle(.barChart.opacity(0.2))
            }
        }
        .chartYScale(domain: yDomain)
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
            plotArea.background(.barChart.opacity(0.02))
        }
    }
}

struct MiniBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        MiniExchangePricesBarChart(data: sampleTodayPricesOnly.today.prices)
            .frame(height: 80)
    }
}
