//
//  GoogleAuthenticationViewModel.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import Foundation
import Firebase
import GoogleSignIn

class GoogleAuthenticationViewModel: ObservableObject {
    
    @Published var isLoginSuccessed = false
    @Published var googleAuth: Bool = false
    
    func singInWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: Application_utility.rootViewController) { user, error in
                
                if let error = error { return }
                
                guard
                    let user = user?.user,
                    let idToken = user.idToken
                else { return }
                
                let accessToken = user.accessToken
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                               accessToken: accessToken.tokenString)
                
                Auth.auth().signIn(with: credential) { result, error in
                    
                    if let error = error { return }
                    
                    guard let user = result?.user else { return }
                    
                    self.googleAuth = true
                }
            }
    }
}
