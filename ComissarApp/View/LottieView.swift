//
//  GifImage.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 01.02.2022.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(self.name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play(fromFrame: .none, toFrame: .infinity, loopMode: .loop, completion: .none)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        view.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        uiView.reloadInputViews()
    }
}
