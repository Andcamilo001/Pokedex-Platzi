//
//  LoginRepository.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import Foundation

final class LoginRepository {
    
    private let loginFireBaseDataSource: LoginDataSource
    
    init(loginFireBaseDataSource: LoginDataSource = LoginDataSource()) {
        self.loginFireBaseDataSource = loginFireBaseDataSource
    }
    
    func getCurrentUser() -> User? {
        loginFireBaseDataSource.getCurrentUser()
    }
    
    func login(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void) {
        loginFireBaseDataSource.login(email: email, password: password, completionBlock: completionBlock)
    }
}
