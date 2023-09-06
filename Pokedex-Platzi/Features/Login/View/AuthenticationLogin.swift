//
//  AuthenticationLogin.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import SwiftUI

struct AuthenticationLogin: View {
    @Environment(\.presentationMode) var authenticationLoginMode
    @State var title: String = appText.titleAuthenticationLogin
    @State var subtitle: String = appText.subtitleAuthenticationLogin
    @State var textButtonEmail: String = appText.signIn
    @State var signIn: Bool = false
    @State var messageMail: Bool = false
    @State var email: String = ""
    @State var isHiddeCredential: Bool = true
    @State var credential: String = ""
    @State var messageCredential: Bool = false
    @ObservedObject var viewModelValidate: AuthenticationValidateViewModel = AuthenticationValidateViewModel()
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: LoginSucess(), isActive: $signIn) { }
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            authenticationLoginMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .accentColor(.black)
                            
                        }
                        .padding(.leading, framesUI.width * -0.35)
                        
                        Text(appText.signIn)
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0465))
                    }
                    .padding(.top, framesUI.height * -0.01)
                    
                    VStack {
                        
                        Text(title)
                            .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.0725))
                            .multilineTextAlignment(.center)
                            .frame(width: framesUI.width * 0.91)
                        
                        Text(subtitle)
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                            .multilineTextAlignment(.center)
                            .frame(width: framesUI.width * 0.91)
                        
                        
                        VStack {
                            ZStack(alignment: .leading) {
                                if email.isEmpty {
                                    Text(appText.mail)
                                        .foregroundColor(.gray)
                                }
                                TextField("", text: $email)
                                    .frame(width: framesUI.width * 0.85)
                                    .accentColor(.black)
                                    .foregroundColor(.black)
                                    .onChange(of: email) { mail in
                                        messageMail = viewModelValidate.isValidEmail(email: mail)
                                    }
                            }
                            .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.065)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            
                            if messageMail == false && email.isEmpty == false {
                                Text(appText.invalidMail)
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0295))
                            }
                        }
                        .padding(.bottom)
                        
                        VStack {
                            ZStack {
                                
                                if self.isHiddeCredential {
                                    
                                    ZStack(alignment: .leading) {
                                        if credential.isEmpty {
                                            Text(appText.credential)
                                                .foregroundColor(.gray)
                                        }
                                        SecureField("", text: $credential)
                                            .frame(width: framesUI.width * 0.85)
                                            .accentColor(Color.black)
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.065)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 2)
                                    )
                                } else {
                                    
                                    ZStack(alignment: .leading) {
                                        if credential.isEmpty {
                                            Text(appText.credential)
                                                .foregroundColor(.gray)
                                        }
                                        TextField("", text: $credential)
                                            .frame(width: framesUI.width * 0.85)
                                            .accentColor(Color.black)
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.065)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 2)
                                    )
                                }
                                Button(action: {
                                    self.isHiddeCredential.toggle()
                                }) {
                                    Image(systemName:  self.isHiddeCredential ? "eye.slash" : "eye")
                                        .accentColor(.black)
                                }
                                .offset(x: framesUI.width * 0.4, y: 0)
                                
                            }
                            .onChange(of: credential) { create in
                                
                                messageCredential = viewModelValidate.isValidCredential(credential: create)
                            }
                            
                            if messageCredential == false && credential.isEmpty == false {
                                Text(appText.invalidCredential)
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0295))
                            }
                        }
                        .padding(.bottom, framesUI.height * 0.3)
                        
                    }
                    .frame(height: framesUI.height * 0.6)
                    .padding(.bottom, framesUI.height * 0.15)
                    
                    if viewModelValidate.buttonIsVali(email: messageMail, createCredential: messageCredential, confirmCredential: true) {
                        
                        Button(action: {
                            loginViewModel.login(email: email, password: credential)
                            if let messageError = loginViewModel.messageError {
                                signIn = false
                                print("error")
                            } else {
                                signIn = true
                                print("success")
                            }
                        }) {
                            ZStack {
                                
                                Text(textButtonEmail)
                                    .font(.custom(Fonts.poppinsBold, size: framesUI.width * 0.04))
                                    .foregroundColor(.white)
                            }
                            .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.0725)
                            .background(PokedexColors.buttonsBlue)
                            .cornerRadius(50)
                        }
                        
                    } else {
                        
                        ZStack {
                            
                            Text(textButtonEmail)
                                .font(.custom(Fonts.poppinsBold, size: framesUI.width * 0.04))
                                .foregroundColor(.gray)
                        }
                        .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.0725)
                        .background(.gray)
                        .opacity(0.4)
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

struct AuthenticationLogin_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationLogin()
    }
}
