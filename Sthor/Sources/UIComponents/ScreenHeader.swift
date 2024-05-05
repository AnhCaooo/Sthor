//
//  ScreenHeader.swift
//  Sthor
//
//  Created by Anh Cao on 4.5.2024.
//

import SwiftUI

struct ScreenHeader: View {
    let header: Header
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(header.title)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                if let unwrappedSubTitle = header.subTitle {
                    Text(unwrappedSubTitle)
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
            }
        }
            
    }
}


struct ScreenHeader_Previews: PreviewProvider {
    static let headers = [
        Header(title: "Dashboard0"),
        Header(title: "Dashboard1", subTitle: "4th May 2024"),
        Header(title: "Dashboard2", subTitle: "")
    ]
    static var previews: some View {
        VStack {
            ForEach(headers, id: \.id) { header in
                ScreenHeader(header: header)
            }
        }
    }
}
