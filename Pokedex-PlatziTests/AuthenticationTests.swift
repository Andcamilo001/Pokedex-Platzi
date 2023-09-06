//
//  AuthenticationTests.swift
//  Pokedex-PlatziTests
//
//  Created by Andres Camilo Lezcano Restrepo on 5/09/23.
//

import XCTest
@testable import Pokedex_Platzi

final class AuthenticationTests: XCTestCase {

    func testIsValidEmailReturnsTrue() {
        let viewModel = AuthenticationValidateViewModel()
        XCTAssertTrue(viewModel.isValidEmail(email: "test@test.com"))
    }
    
    func testIsValidCredentialReturnsTrue() {
        let viewModel = AuthenticationValidateViewModel()
        XCTAssertTrue(viewModel.isValidCredential(credential: "12345678"))
    }

    func testButtonIsValidReturnsTrue() {
        let viewModel = AuthenticationValidateViewModel()
        XCTAssertTrue(viewModel.buttonIsVali(email: true, createCredential: true, confirmCredential: true))
    }
    
    func testIsValidEmailReturnsFalse() {
        let viewModel = AuthenticationValidateViewModel()
        XCTAssertFalse(viewModel.isValidEmail(email: "testtest.com"))
    }
    
    func testIsValidCredentialReturnsFalse() {
        let viewModel = AuthenticationValidateViewModel()
        XCTAssertFalse(viewModel.isValidCredential(credential: "1234567"))
    }

    func testButtonIsValidReturnsFalse() {
        let viewModel = AuthenticationValidateViewModel()
        XCTAssertFalse(viewModel.buttonIsVali(email: true, createCredential: false, confirmCredential: true))
    }
}
