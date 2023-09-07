//
//  MultimediaView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 7/09/23.
//

import SwiftUI
import AVKit

struct MultimediaView: View {
    
    let url = URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
    
    var body: some View {
        NavigationView {
            VStack {
                VideoPlayer(player: .init(url: url))
            }
            .frame(height: framesUI.height * 0.8)
            .padding(.bottom, framesUI.height * 0.08)
            .ignoresSafeArea()
        }
    }
}

struct MultimediaView_Previews: PreviewProvider {
    static var previews: some View {
        MultimediaView()
    }
}
