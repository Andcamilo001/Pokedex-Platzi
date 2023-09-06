//
//  AuthenticationValidateViewModel.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import Foundation


class AuthenticationValidateViewModel: ObservableObject {
    
    func isValidEmail(email: String) -> Bool {
        let pattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return false
        }
        let range = NSRange(location: 0, length: email.count)
        return regex.firstMatch(in: email, options: [], range: range) != nil
    }
    
    func isValidCredential(credential: String) -> Bool {
        return credential.count >= 8
    }
    
    func buttonIsVali(email: Bool, createCredential: Bool, confirmCredential: Bool) -> Bool {
        return email && createCredential && confirmCredential
    }
}
