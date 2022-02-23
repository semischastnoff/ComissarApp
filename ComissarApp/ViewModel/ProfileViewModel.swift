//
//  ProfileViewModel.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 14.01.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    static let shared: ProfileViewModel = ProfileViewModel()
    
    @Published var currentTypeOfLogin: Login = .password
    
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    
    func toggleLoginType(to type: Login) {
        self.currentTypeOfLogin = type
    }
}

enum Login: String, CaseIterable {
    case password = "Вход с паролем"
    case code = "Вход по коду"
}
