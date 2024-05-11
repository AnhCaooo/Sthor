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
        Chart {
            ForEach(dataSeries) {data in
                BarMark(x: .value("Hour", getHourFromStringDate(dateString: data.origTime)),
                        y: .value("Price", data.price)
                )
            }
        }
        .chartPlotStyle { chartContent in
            chartContent
                .background(Color.secondary.opacity(0.1))
//                .frame(height: 200)
        }
        .chartYAxis(.hidden)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct MiniBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        MiniBarChart(receivedData: electricResponsePreviewData)
    }
}
