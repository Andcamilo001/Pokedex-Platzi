//
//  OnboardingScreenThree.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 4/09/23.
//

import SwiftUI

struct OnboardingScreenThree: View {
    @State var image: String = stringToAssets.onboardingImageScreenThree
    @State var title: String = appText.titleOnboardingScreenThree
    @State var subtitle: String = appText.subtitleOnboardingScreenThree
    @State var textButton: String = textButtons.createAccount
    @State var textButtonWhite: String = textButtons.accountExists
    @State var createAccount: Bool = false
    @State var login: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: OnboardingScreenTwo(), isActive: $createAccount) { }
                NavigationLink(destination: OnboardingScreenTwo(), isActive: $login) { }
                
                VStack {
                    
                    Image(image)
                        .frame(width: framesUI.width * 0.83, height: framesUI.height * 0.3225)
                    
                    Text(title)
                        .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(width: framesUI.width * 0.91)
                        .padding()
                    
                    Text(subtitle)
                        .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.038))
                        .multilineTextAlignment(.center)
                        .frame(width: framesUI.width * 0.91)
                        .padding()
                    
                    
                    Button(action: {
                        createAccount = true
                    }) {
                        ZStack {
                            
                            Text(textButton)
                                .font(.custom(Fonts.poppinsBold, size: framesUI.width * 0.05))
                                .foregroundColor(.white)
                        }
                        .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.0725)
                        .background(PokedexColors.buttonsBlue)
                        .cornerRadius(50)
                    }
                    .padding()
                    
                    Button(action: {
                        login = true
                    }) {
                        Text(textButtons.accountExists)
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.05))
                            .foregroundColor(PokedexColors.buttonsBlue)
                    }
                }
                .padding(.top, framesUI.height * 0.14)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PokedexColors.backgroundWhite)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct OnboardingScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenThree()
    }
}
