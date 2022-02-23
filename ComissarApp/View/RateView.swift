//
//  RateView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 21.01.2022.
//

import SwiftUI

struct RateView: View {
    @State var name: String
    @State var rateNumber: Int
    @State var rateBody: String
    @State var date: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.name)
                .font(.headline)
                .padding(.vertical, 10)
            
            HStack {
                StarsView(rate: self.rateNumber)
                    .font(.caption)
                Spacer()
                Text(self.date, format: .dateTime.day().month().year())
                    .foregroundColor(.primary.opacity(0.6))
            }
            
            Text(self.rateBody)
                .padding(.vertical, 10)
        }
        .padding(30)
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(name: "Andrey", rateNumber: 4, rateBody: "Lorem Ipsum", date: Date.now)
    }
}
