//
//  AuthenticationRepository.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import Foundation

final class AuthenticationRepository {
    
    private let authtnticationFireBaseDataSource: AuthenticationDataSource
    
    init(authtnticationFireBaseDataSource: AuthenticationDataSource = AuthenticationDataSource()) {
        self.authtnticationFireBaseDataSource = authtnticationFireBaseDataSource
    }
    
    func getCurrentUser() -> User? {
        authtnticationFireBaseDataSource.getCurrentUser()
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void) {
        authtnticationFireBaseDataSource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
}
