//
//  AdvancedBarChart.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts

struct AdvancedBarChart: View {
    let formatter: DateFormatter
    /// Receiving parameter
    var data: PriceSeries
    /// Properties
    private var unit: String
    private var dataSeries: [TimelyData]
    /// State properties
    @State private var chartSelection: Date?
    
    init(data: PriceSeries) {
        self.data = data
        self.unit = data.name
        self.dataSeries = data.data
        self.formatter = DateFormatter()
    }
    
    var body: some View {
        let currentTime: String = Timer().getCurrentTimeWithDateAndHourOnly()
        let currentPrice: String = self.data.getCurrentPrice()
        
        let yValues = dataSeries.map { $0.price }
        let maxYValue = yValues.max() ?? 50
        let minYValue = yValues.min() ?? -5
        let yDomain = min(minYValue, -5)...max(maxYValue, 50)
        
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
                            Text("\(getPrice(date: chartSelection)) \(unit)")
                        }
                    }
            } else if currentTime == $0.origTime {
                RuleMark(x: .value("Hour", formatter.parseStringToDate(date: $0.origTime), unit: .hour))
                    .foregroundStyle(.gray.opacity(0.5))
                    .annotation(
                    position:
                        .top,
                        overflowResolution: .init(x: .fit, y: .disabled)
                    ) {
                        ZStack {
                            Text("\(currentPrice) \(unit)")
                        }
                    }
            }
        }
        .chartYScale(domain: yDomain)
        .chartXAxis {
            AxisMarks(values: .stride(by: .hour, count: 3)) { value in
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
        .chartXSelection(value: $chartSelection)
        
    }
}

extension AdvancedBarChart {
    func getPrice(date: Date) -> String {
        let receivedDate = formatter.formatDateToString(date: date, format: "yyyy-MM-dd HH:00:00")
        if let filteredData = dataSeries.first(where: {$0.time == receivedDate}) {
            return String(format: "%.2f", filteredData.price)
        }
        return "0.00"
    }
}

#Preview {
    AdvancedBarChart(data: sampleTodayPricesOnly.today.prices)
        .frame(height: 300)
}
