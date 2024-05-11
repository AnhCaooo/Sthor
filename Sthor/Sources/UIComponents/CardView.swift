//
//  CardView.swift
//  Sthor
//
//  Created by Anh Cao on 9.5.2024.
//

import SwiftUI

struct CardView: View {
    let priceResponse: PriceResponse
    var body: some View {
        VStack {
            HStack{
                Text("Exchange price of electric now")
                Spacer()
            }
            Spacer()
            HStack {
                VStack {
                    Text("0.05")
                    Text(priceResponse.data.series[0].name)
                }
                Spacer()
                Text("charts")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
        
        
    }
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
