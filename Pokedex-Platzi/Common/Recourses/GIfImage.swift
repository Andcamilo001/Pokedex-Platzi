//
//  GIfImage.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 4/09/23.
//

import SwiftUI
import FLAnimatedImage


struct GifImage: UIViewRepresentable {
    
    let animatedView = FLAnimatedImageView()
    var name: String
    
    func makeUIView(context: UIViewRepresentableContext<GifImage>) -> UIView {
        let view = UIView()
        
        let path: String = Bundle.main.path(forResource: name, ofType: "gif")!
        let url = URL(fileURLWithPath: path)
        let gifData = try! Data(contentsOf:  url)
        
        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif
        
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)
        
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GifImage>) {
        
    }
}
