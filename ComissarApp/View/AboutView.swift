//
//  AboutView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 13.01.2022.
//

import SwiftUI

struct AboutView: View {
    @StateObject var aboutViewModel: AboutViewModel = AboutViewModel.shared
    
    var body: some View {
        GeometryReader { gp in
            VStack(alignment: .center) {
                HStack {
                    ForEach(AboutType.allCases, id: \.self) { item in
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.aboutViewModel.toggleAboutType(to: item)
                            }
                        } label: {
                            Text(item.rawValue)
                                .frame(width: (gp.size.width - 80) / 2)
                                .padding(10)
                                .foregroundColor(self.aboutViewModel.currentAboutType == item ? .white : .black)
                                .background(self.aboutViewModel.currentAboutType == item ? .blue.opacity(0.7) : .white, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke()
                                )
                                .scaledToFit()
                        }
                        .buttonStyle(.plain)
                        if item != .rates {
                            Spacer()
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Group {
                    switch self.aboutViewModel.currentAboutType {
                    case .information:
                        VStack {
                            ScrollView {
                                TabView {
                                    ForEach(["2", "1", "3"], id: \.self) { item in
                                        Image(item)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                    }
                                }
                                .tabViewStyle(.page)
                                .frame(width: gp.size.width - 40, height: gp.size.height / 2, alignment: .center)
                                .padding(.bottom, 30)
                                
                                VStack(alignment: .leading) {
                                    Text("-\tСтрижки и бритье за 500 рублей")
                                    Text("-\tКаждая 7 стрижка бесплатно")
                                    Text("-\tКонтроль качества старшим мастером в смене")
                                    Text("-\tБесплатная укладка в любой день для тех, кто купил у нас косметику")
                                    Text("-\tТелефон:\t+7 812 507-02-77")
                                    Text("-\tВремя работы:\tПн, Вт, Ср, Чт, Пт, Сб, Вс 10:00-22:00")
                                }
                                .padding(20)
                                .padding(.bottom, 100)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        
                    case .rates:
                        ScrollView {
                            ForEach(self.aboutViewModel.ratesArray, id: \.self) { item in
                                RateView(name: item.name, rateNumber: item.rateNumber, rateBody: item.rateBody, date: item.date)
                            }
                            .padding(.bottom, 60)
                        }
                    }
                }
                
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
