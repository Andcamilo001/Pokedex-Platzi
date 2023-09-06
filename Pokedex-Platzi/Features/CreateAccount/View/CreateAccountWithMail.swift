//
//  CreateAccountWithMail.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import SwiftUI

struct CreateAccountWithMail: View {
    @Environment(\.presentationMode) var createAccountMailMode
    @State var letsGo: String = textButtons.letsGo
    @State var whatIsYourMail: String = appText.whatIsYourMail
    @State var createCredentials: String = appText.createCredentials
    @State var confirmCredentials: String = appText.confirmCredentials
    @State var textButtonEmail: String = textButtons.create
    @State var createEmail: Bool = false
    @ObservedObject var viewModel: AuthenticationViewModel = AuthenticationViewModel()
    @State var messageMail: Bool = false
    @State var email: String = ""
    @State var isHiddeCreateCredential: Bool = true
    @State var isHiddeConfirmCredential: Bool = true
    @State var createCredential: String = ""
    @State var confirmCredential: String = ""
    @State var messageCreateCredential: Bool = false
    @State var messageConfirmCredential: Bool = false
    @State var createAccount: Bool = false
    @ObservedObject var viewModelValidate: AuthenticationValidateViewModel = AuthenticationValidateViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: CreateAccountSuccess(), isActive: $createEmail) { }
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            createAccountMailMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .accentColor(.black)
                            
                        }
                        .padding(.leading, framesUI.width * -0.25)
                        
                        Text(appText.createAccount)
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0465))
                    }
                    .padding(.top, framesUI.height * -0.01)
                    
                    VStack {
                        
                        Text(letsGo)
                            .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.0725))
                            .multilineTextAlignment(.center)
                            .frame(width: framesUI.width * 0.91)
                        
                        Text(whatIsYourMail)
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
                        
                        Text(createCredentials)
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                            .multilineTextAlignment(.center)
                            .frame(width: framesUI.width * 0.91)
                            .padding(.top)
                        
                        VStack {
                            ZStack {
                                
                                if self.isHiddeCreateCredential {
                                    
                                    ZStack(alignment: .leading) {
                                        if createCredential.isEmpty {
                                            Text(appText.credential)
                                                .foregroundColor(.gray)
                                        }
                                        SecureField("", text: $createCredential)
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
                                        if createCredential.isEmpty {
                                            Text(appText.credential)
                                                .foregroundColor(.gray)
                                        }
                                        TextField("", text: $createCredential)
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
                                    self.isHiddeCreateCredential.toggle()
                                }) {
                                    Image(systemName:  self.isHiddeCreateCredential ? "eye.slash" : "eye")
                                        .accentColor(.black)
                                }
                                .offset(x: framesUI.width * 0.4, y: 0)
                                
                            }
                            .onChange(of: createCredential) { create in
                                
                                messageCreateCredential = viewModelValidate.isValidCredential(credential: create)
                            }
                            
                            if messageCreateCredential == false && createCredential.isEmpty == false {
                                Text(appText.invalidCredential)
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0295))
                            }
                        }
                        
                        Text(confirmCredentials)
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                            .multilineTextAlignment(.center)
                            .frame(width: framesUI.width * 0.91)
                            .padding(.top)
                        
                        VStack {
                            ZStack {
                                
                                if self.isHiddeConfirmCredential {
                                    
                                    ZStack(alignment: .leading) {
                                        if confirmCredential.isEmpty {
                                            Text(appText.credential)
                                                .foregroundColor(.gray)
                                        }
                                        SecureField("", text: $confirmCredential)
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
                                        if confirmCredential.isEmpty {
                                            Text(appText.credential)
                                                .foregroundColor(.gray)
                                        }
                                        TextField("", text: $confirmCredential)
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
                                    self.isHiddeConfirmCredential.toggle()
                                }) {
                                    Image(systemName:  self.isHiddeConfirmCredential ? "eye.slash" : "eye")
                                        .accentColor(.black)
                                }
                                .offset(x: framesUI.width * 0.4, y: 0)
                                
                            }
                            .onChange(of: confirmCredential) { confirm in
                                
                                messageConfirmCredential = confirm == createCredential
                            }
                            
                            if messageConfirmCredential == false && confirmCredential.isEmpty == false {
                                Text(appText.invalidConfirmCredential)
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0295))
                            }
                        }
                    }
                    .frame(height: framesUI.height * 0.6)
                    .padding(.bottom, framesUI.height * 0.15)
                    
                    if viewModelValidate.buttonIsVali(email: messageMail, createCredential: messageCreateCredential, confirmCredential: messageConfirmCredential) {
                        
                        Button(action: {
                            viewModel.createNewUser(email: email, password: confirmCredential)
                            if let messageError = viewModel.messageError {
                                createEmail = false
                                print(createEmail)
                            } else {
                                createEmail = true
                                print(createEmail)
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

struct CreateAccountWithMail_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountWithMail()
    }
}
