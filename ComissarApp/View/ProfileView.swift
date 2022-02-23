//
//  ProfileView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 14.01.2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel: ProfileViewModel = ProfileViewModel.shared
    @StateObject var contentViewModel: ContentViewModel = ContentViewModel.shared
    
    var body: some View {
        GeometryReader { gp in
            VStack {
                VStack {
                    HStack {
                        ForEach(Login.allCases, id: \.self) { item in
                            Button {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    self.profileViewModel.toggleLoginType(to: item)
                                }
                            } label: {
                                Text(item.rawValue)
                                    .font(.footnote)
                                    .frame(width: (gp.size.width - 40) / 2 - 50)
                                    .padding(10)
                                    .foregroundColor(self.profileViewModel.currentTypeOfLogin == item ? .white : .black)
                                    .background(self.profileViewModel.currentTypeOfLogin == item ? .blue.opacity(0.7) : .white, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke()
                                    )
                                    .scaledToFit()
                            }
                            .buttonStyle(.plain)
                            if item == .password {
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Group {
                        switch self.profileViewModel.currentTypeOfLogin {
                        case .password:
                            VStack {
                                Spacer()
                                Text("Введите номер телефона и пароль")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                self.textFieldPassword
                                Spacer()
                            }
                        case .code:
                            VStack {
                                Spacer()
                                Text("Введите номер телефона. Сейчас на него придет смс или звонок.\nОтвечать на звонок не нужно")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                self.textFieldPhoneNumber
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                    self.applyButton
                }
                .padding(40)
                .frame(width: gp.size.width - 40, height: gp.size.width - 40, alignment: .center)
                .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                .position(x: gp.size.width / 2, y: gp.size.height / 2)
                
                self.quitButton
                    .padding(.bottom, 60)
            }
        }
    }
    
    var quitButton: some View {
        Button {
            withAnimation(.easeOut) {
                self.contentViewModel.closeProfileView()
            }
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.primary)
                .font(.body)
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
        }
    }
    
    @State var phoneNumber: String = ""
    @State var password: String = ""
    
    var textFieldPassword: some View {
        VStack {
            TextField("Введите номер телефона", text: self.$phoneNumber)
            SecureInputView("Введите пароль", text: self.$password)
        }
        .font(.body)
        .frame(maxWidth: .infinity)
    }
    
    var textFieldPhoneNumber: some View {
        TextField("Введите номер телефона", text: self.$phoneNumber)
            .font(.body)
            .frame(maxWidth: .infinity)
    }
    
    var applyButton: some View {
        Button {
            withAnimation(.easeOut) {
                self.contentViewModel.closeProfileView()
            }
        } label: {
            Text(self.profileViewModel.currentTypeOfLogin == .password ? "Войти" : "Получить код")
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.black)
                .background(.white, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
