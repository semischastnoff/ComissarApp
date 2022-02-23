//
//  ChooseBarberView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 20.02.2022.
//

import SwiftUI

struct ChooseBarberView: View {
    @StateObject var visitViewModel: VisitViewModel = VisitViewModel.shared
    
    var body: some View {
        GeometryReader { gp in
            VStack {
                HStack(alignment: .center) {
                    Button {
                        withAnimation(.spring()) {
                            self.visitViewModel.currentChooseView = nil
                        }
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .font(.title3)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Text("Выберите специалиста")
                        .font(.title3)
                        .padding(.trailing)
                        .layoutPriority(1)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                ScrollView {
                    ForEach(self.visitViewModel.crew, id: \.self) { item in
                        VStack {
                            HStack {
                                Image(systemName: item.photo)
                                    .resizable()
                                    .padding()
                                    .frame(width: gp.size.width / 5, height: gp.size.width / 5)
                                VStack(alignment: .leading) {
                                    Text(item.qualification)
                                        .foregroundColor(.primary.opacity(0.5))
                                    Text(item.name)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    StarsView(rate: item.rate)
                                }
                                .padding(.leading)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Text(item.closestDate, format: .dateTime.weekday().day())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                            HStack {
                                ForEach(item.time, id: \.self) { currentTime in
                                    Text(currentTime, format: .dateTime.hour().minute())
                                        .padding(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke()
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                        .padding(.bottom)
                        .padding(.horizontal)
                    }
                }
                .shadow(color: .primary.opacity(0.2), radius: 30, x: 5, y: 10)
            }
        }
    }
}

struct ChooseBarberView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseBarberView()
    }
}
