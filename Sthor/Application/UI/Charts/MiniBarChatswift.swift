//
//  MiniBarChatswift.swift
//  Sthor
//
//  Created by Anh Cao on 11.5.2024.
//

import SwiftUI
import Charts

struct MiniBarChatswift: View {
    let data: PriceResponse
    var dataSeries = electricResponsePreviewData.data.series[0].data
    var body: some View {
        Chart {
            ForEach(dataSeries) {data in
                BarMark(x: .value("Hour", data.origTime),
                        y: .value("Price", data.price)
                )
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    MiniBarChatswift(data: PriceResponse)
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(priceResponse: electricResponsePreviewData)
            CardView(priceResponse: electricResponsePreviewData)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        
    }
}
