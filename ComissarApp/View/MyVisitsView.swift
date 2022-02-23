//
//  MyVisitsView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 13.01.2022.
//

import SwiftUI

struct MyVisitsView: View {
    @StateObject var myVisitsViewModel: MyVisitsViewModel = MyVisitsViewModel.shared
    @Environment(\.colorScheme) var colorScheme
    
    @State var showAlertToDelete: Bool = false
    
    var body: some View {
        GeometryReader { gp in
            if self.myVisitsViewModel.myVisitsArray.isEmpty {
                VStack {
                    LottieView("wave2")
                        .frame(width: gp.size.width - 200, height: gp.size.width - 200, alignment: .center)
                        .background(.primary)
                        .foregroundColor(self.colorScheme == .dark ? .black : .white)
                    VStack {
                        Text("На данный момент у Вас нет записей")
                            .padding(.vertical, 50)
                        Button {
                            withAnimation(.easeOut) {
                                self.myVisitsViewModel.changeTab(to: .visit)
                            }
                        } label: {
                            Text("Записаться")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(.black)
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(.top, 50)
            } else {
                ScrollView {
                    ForEach(self.myVisitsViewModel.myVisitsArray, id: \.self) { item in
                        VStack(alignment: .leading) {
                            ZStack {
                                GeometryReader { gp in
                                    Button {
                                        withAnimation(.easeIn) {
                                            self.showAlertToDelete = true
                                        }
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.red)
                                            .padding(5)
                                            .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 30))
                                    }
                                    .position(x: gp.size.width - 20, y: 25)
                                    .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                                    .alert(isPresented: self.$showAlertToDelete) {
                                        Alert(title: Text("Удалить запись"), message: Text("Вы действительно хотите отменить запись? Данное действие отменить невозможно"), primaryButton: .destructive(Text("Да")) {
                                                withAnimation(.easeIn) {
                                                    self.myVisitsViewModel.deleteVisit(of: item)
                                                    self.showAlertToDelete = false
                                                }
                                            }, secondaryButton: .cancel())
                                    }
                                }
                                VStack(alignment: .leading) {
                                    Text("Запись")
                                        .font(.headline)
                                        .padding(.vertical)
                                    HStack {
                                        Text("Филиал: ")
                                            .layoutPriority(1)
                                        Spacer()
                                        Text(item.place.rawValue)
                                    }
                                    HStack {
                                        Text("Время: ")
                                            .layoutPriority(1)
                                        Spacer()
                                        Text(item.time.formatted())
                                    }
                                    Text("Ваш барбер \(item.barber)")
                                        .padding(.bottom)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                        .padding(.top, 30)
                    }
                }
                .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                .padding(.horizontal)
                .padding(.bottom, 60)
            }
        }
    }
}

struct MyVisitsView_Previews: PreviewProvider {
    static var previews: some View {
        MyVisitsView()
    }
}
