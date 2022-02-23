//
//  myVisitsViewModel.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 01.02.2022.
//

import Foundation

class MyVisitsViewModel: ObservableObject {
    static let shared: MyVisitsViewModel = MyVisitsViewModel()
    private var contentViewModel: ContentViewModel = ContentViewModel.shared
    
    @Published var myVisitsArray: [Visit] = [
        Visit(place: .instrumentalnaya, time: Date.now.advanced(by: 86400), barber: "Владимир"),
        Visit(place: .fontanka, time: Date.now.advanced(by: 32987130), barber: "Григорий")
    ]
    
    func changeTab(to tab: Tab) {
        self.contentViewModel.currentTab = tab
    }
    
    func deleteVisit(of visit: Visit) {
        guard let index = self.myVisitsArray.firstIndex(of: visit) else { return }
        self.myVisitsArray.remove(at: index)
    }
}

struct Visit: Hashable {
    var place: Place
    var time: Date
    var barber: String
}
