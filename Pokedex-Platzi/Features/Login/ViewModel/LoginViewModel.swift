//
//  LoginViewModel.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import Foundation

class LoginViewModel: ObservableObject {
   
    @Published var user: User?
    @Published var messageError: String?
    @Published var emailAuth: Bool = false
    
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository = LoginRepository()) {
        self.loginRepository = loginRepository
        getCurrentUser()
    }
    
    func login(email: String, password: String) {
        loginRepository.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                self?.emailAuth = true
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    
    func getCurrentUser() {
        self.user = loginRepository.getCurrentUser()
    }
    
}
