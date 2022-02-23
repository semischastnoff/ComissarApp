//
//  SecureInputView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 17.01.2022.
//

import SwiftUI

struct SecureInputView: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye" : "eye.slash")
                    .accentColor(.gray)
            }
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        Text("kek")
    }
}
