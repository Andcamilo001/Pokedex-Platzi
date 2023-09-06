//
//  LoginSucess.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import SwiftUI

struct LoginSucess: View {
    @State var image: String = stringToAssets.loginSuccess
    @State var title: String = appText.titleLoginSuccess
    @State var subtitle: String = appText.subtitleLoginSuccess
    @State var textButton: String = textButtons.next
    @State var nextPage: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: OnboardingScreenThree(), isActive: $nextPage) { }
                
                Image(stringToAssets.createAccountBackground)
                    .padding(.bottom, framesUI.height * 0.4)
                
                VStack {
                    
                    Image(image)
                        .frame(width: framesUI.width * 0.83, height: framesUI.height * 0.3225)
                    
                    Text(title)
                        .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                        .multilineTextAlignment(.center)
                        .lineLimit(4)
                        .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.1)
                        .padding(.top)
                    
                    Text(subtitle)
                        .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.038))
                        .multilineTextAlignment(.center)
                        .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.08)
                    
                    
                    Button(action: {
                        nextPage = true
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
                }
                .padding(.top, framesUI.height * 0.21)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PokedexColors.backgroundWhite)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginSucess_Previews: PreviewProvider {
    static var previews: some View {
        LoginSucess()
    }
}
