//
//  StarsView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 21.01.2022.
//

import SwiftUI

struct StarsView: View {
    @State var rate: Int
    
    var body: some View {
        HStack {
            ForEach(0..<rate) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            ForEach(rate..<5) { _ in
                Image(systemName: "star")
            }
        }
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(rate: 3)
    }
}
