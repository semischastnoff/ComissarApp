//
//  VisitView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 13.01.2022.
//

import SwiftUI

struct VisitView: View {
    @StateObject var visitViewModel: VisitViewModel = VisitViewModel.shared
    
    var body: some View {
        GeometryReader { gp in
                switch self.visitViewModel.currentChooseView {
                case .barber:
                    ChooseBarberView()
                case .product:
                    ChooseProductView()
                case .time:
                    ChooseTimeView()
                default:
                    ScrollView {
                        ForEach(ChooseView.allCases, id: \.self) { item in
                            Button {
                                withAnimation(.spring()) {
                                    self.visitViewModel.changeCurrentChooseView(to: item)
                                }
                            } label: {
                                HStack {
                                    switch item {
                                    case .barber:
                                        Image(systemName: "person.3")
                                            .frame(width: gp.size.width / 6)
                                    case .product:
                                        Image(systemName: "checklist")
                                            .frame(width: gp.size.width / 6)
                                    case .time:
                                        Image(systemName: "calendar")
                                            .frame(width: gp.size.width / 6)
                                    }
                                    Text(item.rawValue)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading, 10)
                                }
                                .font(.title2)
                                .foregroundColor(.primary)
                                .padding(25)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                                .padding()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .shadow(color: .primary.opacity(0.2), radius: 30, x: 5, y: 10)
                }
        }
    }
}

struct VisitView_Previews: PreviewProvider {
    static var previews: some View {
        VisitView()
    }
}
