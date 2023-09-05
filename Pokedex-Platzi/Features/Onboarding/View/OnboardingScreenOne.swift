//
//  OnboardingScreenOne.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 4/09/23.
//

import SwiftUI

struct OnboardingScreenOne: View {
    
    @State var page: Int = 1
    @State var image: String = stringToAssets.onboardingImageScreenOne
    @State var title: String = appText.titleOnboardingScreenOne
    @State var subtitle: String = appText.subtitleOnboardingScreenOne
    @State var textButton: String = textButtons.next
    @State var nextPage: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: OnboardingScreenTwo(), isActive: $nextPage) { }
                
                VStack {
                    
                    Image(image)
                        .resizable()
                        .frame(width: framesUI.width * 0.79, height: framesUI.height * 0.3225)
                    
                    Text(title)
                        .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                        .multilineTextAlignment(.center)
                        .lineLimit(4)
                        .frame(width: framesUI.width * 0.91)
                        .padding()
                    
                    Text(subtitle)
                        .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.038))
                        .multilineTextAlignment(.center)
                        .frame(width: framesUI.width * 0.91)
                        .padding()
                    
                    switch page {
                        
                    case 1 :
                        
                        HStack {
                            Rectangle()
                                .frame(width: framesUI.width * 0.077, height: framesUI.height * 0.011)
                                .cornerRadius(11)
                                .foregroundColor(PokedexColors.buttonsBlue)
                            
                            Circle()
                                .frame(width: framesUI.width * 0.025, height: framesUI.height * 0.01125)
                                .foregroundColor(PokedexColors.buttonsBlue)
                                .opacity(0.4)
                        }
                        .padding()
                        
                    case 2 :
                        
                        HStack {
                            Circle()
                                .frame(width: framesUI.width * 0.025, height: framesUI.height * 0.01125)
                                .foregroundColor(PokedexColors.buttonsBlue)
                                .opacity(0.4)
                            
                            Rectangle()
                                .frame(width: framesUI.width * 0.077, height: framesUI.height * 0.011)
                                .cornerRadius(11)
                                .foregroundColor(PokedexColors.buttonsBlue)
                        }
                        .padding()
                        
                    default:
                        EmptyView()
                        
                    }
                    
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
                .padding(.top, framesUI.height * 0.18)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PokedexColors.backgroundWhite)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenOne()
    }
}
