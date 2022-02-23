//
//  AboutViewModel.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 20.01.2022.
//

import Foundation

class AboutViewModel: ObservableObject {
    static let shared: AboutViewModel = AboutViewModel()
    
    @Published var currentAboutType: AboutType = .rates
    
    @Published var ratesArray: [RateBody] = [
        RateBody(name: "Andrey", rateNumber: 3, rateBody: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", date: Date.now),
        RateBody(name: "Boris", rateNumber: 5, rateBody: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", date: Date.distantPast)
    ]
    
    func toggleAboutType(to type: AboutType) {
        self.currentAboutType = type
    }
}

struct RateBody: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var rateNumber: Int
    var rateBody: String
    var date: Date
}

enum AboutType: String, CaseIterable {
    case information = "Информация"
    case rates = "Отзывы"
}
