//
//  AuthenticationViewModel.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var user: User?
    @Published var messageError: String?
    @Published var emailAuth: Bool = false
    
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository()) {
        self.authenticationRepository = authenticationRepository
        getCurrentUser()
    }
    
    func createNewUser(email: String, password: String) {
        authenticationRepository.createNewUser(email: email, password: password) { [weak self] result in
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
        self.user = authenticationRepository.getCurrentUser()
    }
    
    func logOut() {
        do {
            try authenticationRepository.logOut()
            self.user = nil
        } catch {
            print("Error")
        }
    }
}
