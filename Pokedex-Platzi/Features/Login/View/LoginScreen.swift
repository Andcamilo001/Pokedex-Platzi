//
//  LoginScreen.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import SwiftUI
import AuthenticationServices

struct LoginScreen: View {
    @Environment(\.presentationMode) var loginScreenMode
    @State var image: String = stringToAssets.loginScreen
    @State var title: String = appText.titleLoginScreen
    @State var subtitle: String = appText.subtitleLoginScreen
    @State var textButtonEmail: String = textButtons.createWithMail
    @State var textButtonApple: String = textButtons.createWithApple
    @State var textButtonGoogle: String = textButtons.createWithGoogle
    @State var loginEmail: Bool = false
    @State var currentNonce: String?
    @ObservedObject var appleAuthenticationViewModel: AppleAuthenticationViewModel = AppleAuthenticationViewModel()
    @ObservedObject var googleAuthenticationViewModel: GoogleAuthenticationViewModel = GoogleAuthenticationViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: LoginSucess(), isActive: $appleAuthenticationViewModel.appleAuth) { }
                NavigationLink(destination: LoginSucess(), isActive: $googleAuthenticationViewModel.googleAuth) { }
                NavigationLink(destination: AuthenticationLogin(), isActive: $loginEmail) { }
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            loginScreenMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .accentColor(.black)
                            
                        }
                        
                        .padding(.leading, framesUI.width * -0.35)
                        Text(appText.signIn)
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0465))
                    }
                    .padding(.top, framesUI.height * -0.01)
                    
                    Image(image)
                        .frame(width: framesUI.width * 0.83, height: framesUI.height * 0.3225)
                        .padding(.top, framesUI.height * 0.1)
                    
                    Text(title)
                        .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(width: framesUI.width * 0.91)
                    
                    Text(subtitle)
                        .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.038))
                        .multilineTextAlignment(.center)
                        .frame(width: framesUI.width * 0.91)
                        .padding(.top, framesUI.height * 0.001)

                    
                    SignInWithAppleButton(.continue) { (request) in
                        
                        appleAuthenticationViewModel.nonce = appleAuthenticationViewModel.randomNonceString()
                        request.requestedScopes = [.email, .fullName]
                        request.nonce = appleAuthenticationViewModel.sha256(appleAuthenticationViewModel.nonce)
                        
                    } onCompletion: { (result) in
                        
                        switch result{
                        case .success(let user):
                            guard let credential = user.credential as? ASAuthorizationAppleIDCredential else { return }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    .signInWithAppleButtonStyle(.white)
                    .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.0725)
                    .background(PokedexColors.backgroundWhite)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.top, framesUI.height * 0.007)
                    
                    
                    Button(action: {
                        googleAuthenticationViewModel.singInWithGoogle()
                    }) {
                        ZStack {
                            
                            HStack {
                                
                                Image(stringToAssets.googleIcon)
                                    
                                
                                Text(textButtonGoogle)
                                    .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.054))
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.0725)
                        .background(PokedexColors.backgroundWhite)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    }
                    
                    Button(action: {
                        loginEmail = true
                    }) {
                        ZStack {
                            
                            Text(textButtonEmail)
                                .font(.custom(Fonts.poppinsBold, size: framesUI.width * 0.052))
                                .foregroundColor(.white)
                        }
                        .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.0725)
                        .background(PokedexColors.buttonsBlue)
                        .cornerRadius(50)
                    }
                    
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PokedexColors.backgroundWhite)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
