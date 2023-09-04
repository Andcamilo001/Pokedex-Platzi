//
//  SplashScreen.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 4/09/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            VStack {
                GifImage(name: stringToAssets.pikachu)
            }
            .frame(width: framesUI.width * 0.65, height: framesUI.height * 0.35)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PokedexColors.backgroundBlue)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
