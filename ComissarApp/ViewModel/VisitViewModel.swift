//
//  VisitViewModel.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 09.02.2022.
//

import Foundation

class VisitViewModel: ObservableObject {
    static let shared: VisitViewModel = VisitViewModel()
    
    @Published var currentChooseView: ChooseView?
    
    @Published var crew: [CrewMember] = [
        CrewMember(name: "Руслан", photo: "person", qualification: "Шеф-барбер", rate: 5, closestDate: Date.now.addingTimeInterval(-10000), time: [Date.now.addingTimeInterval(-10000), Date.now.addingTimeInterval(-9000)]),
        CrewMember(name: "Евгений", photo: "person", qualification: "TOP барбер", rate: 5, closestDate: Date.now.addingTimeInterval(-10000), time: [Date.now.addingTimeInterval(-10000), Date.now.addingTimeInterval(-9000)])
    ]
    
    func changeCurrentChooseView(to view: ChooseView) {
        self.currentChooseView = view
    }
}

enum ChooseView: String, CaseIterable {
    case barber = "Выбрать специалиста"
    case product = "Выбрать услугу"
    case time = "Выбрать дату и время"
}

struct CrewMember: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let photo: String
    let qualification: String
    let rate: Int
    let closestDate: Date
    let time: [Date]
}
