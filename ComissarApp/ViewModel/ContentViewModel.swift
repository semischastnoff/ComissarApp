//
//  ContentViewModel.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 13.01.2022.
//

import Foundation

class ContentViewModel: ObservableObject {
    static let shared: ContentViewModel = ContentViewModel()
    let tabBarImagesDict: [Tab : String] = [
        .visit : "scissors.circle.fill",
        .places : "location.circle.fill",
        .myVisits : "list.bullet.rectangle.portrait.fill",
        .about : "info.circle.fill"
    ]
    
    @Published var currentTab: Tab = .visit
    @Published var currentPlace: Place = .fontanka
    @Published var showProfileView: Bool = false
    
    func changeCurrentTab(to tab: Tab) {
        self.currentTab = tab
    }
    
    func openProfileView() {
        self.showProfileView = true
    }
    
    func closeProfileView() {
        self.showProfileView = false
    }
}

enum Tab: String, CaseIterable {
    case visit = "Записаться"
    case places = "Филиалы"
    case myVisits = "Мои записи"
    case about = "О нас"
}

enum Place: String, CaseIterable {
    case fontanka = "Фонтанка 54"
    case instrumentalnaya = "Инструментальная 3г"
}
