//
//  SplashScreen.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 4/09/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var pageOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                NavigationLink(destination: OnboardingScreenOne(), isActive: $pageOnboarding) { }
                
                VStack {
                    GifImage(name: stringToAssets.pikachu)
                }
                .frame(width: framesUI.width * 0.65, height: framesUI.height * 0.35)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PokedexColors.backgroundWhite)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
                self.pageOnboarding = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
