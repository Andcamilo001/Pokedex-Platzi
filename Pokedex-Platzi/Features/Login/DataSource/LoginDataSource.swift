//
//  LoginDataSource.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import Foundation
import FirebaseAuth


final class LoginDataSource {
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func login(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            let email = authDataResult?.user.email ?? "No email"
            completionBlock(.success(.init(email: email)))
        }
    }
}
