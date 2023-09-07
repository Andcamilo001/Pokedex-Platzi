//
//  Constans.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 4/09/23.
//

import Foundation
import SwiftUI

struct PokedexColors {
    
    static let backgroundWhite = Color(red: 247/255, green: 247/255, blue: 249/255)
    static let buttonsBlue = Color(red: 23/255, green: 62/255, blue: 165/255)
}

struct stringToAssets {
    
    static let pikachu = "pikachuAnimated"
    static let onboardingImageScreenOne = "OnboardingScreenOne"
    static let onboardingImageScreenTwo = "OnboardingScreenTwo"
    static let onboardingImageScreenThree = "OnboardingScreenThree"
    static let createAccountScreen = "CreateAccountScreen"
    static let googleIcon = "GoogleIcon"
    static let appleIcon = "AppleIcon"
    static let createAccountSuccess = "CreateAccountSuccess"
    static let createAccountBackground = "CreateAccountBackground"
    static let loginScreen = "LoginScreen"
    static let loginSuccess = "LoginSuccess"
    static let pokedexUnselected = "PokedexUnselected"
    static let regionUnselected = "RegionUnselected"
    static let favoritesUnselected = "FavoritesUnselected"
    static let profileUnselected = "ProfileUnselected"
    static let pokedexSelected = "PokedexSelected"
    static let regionSelected = "RegionSelected"
    static let favoritesSelected = "FavoritesSelected"
    static let profileSelected = "ProfileSelected"
}

struct framesUI {
    
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    
}

struct textButtons {
    
    static let next = "Continuar"
    static let letsGo = "Vamos a comenzar"
    static let createAccount = "Crear cuenta"
    static let accountExists = "Ya tengo una cuenta"
    static let createWithApple = "Continuar con Apple"
    static let createWithGoogle = "Continuar con Google"
    static let createWithMail = "Continuar con email"
    static let create = "Crear"
    static let tabOne = "Pokedex"
    static let tabTwo = "Region"
    static let tabThree = "Multimedia"
    static let tabFour = "Perfil"
}

struct Fonts {
    
    static let poppinsBold = "Poppins-Bold"
    static let poppinsSemiBold = "Poppins-SemiBold"
    static let poppinsLight = "Poppins-Light"
    static let poppinsRegular = "Poppins-Regular"
}

struct appText {
    
    static let titleOnboardingScreenOne = "Todos los Pokémon en un solo lugar"
    static let subtitleOnboardingScreenOne = "Accede a una amplia lista de Pokémon de todas las generaciones de Nintendo"
    static let titleOnboardingScreenTwo = "Mantén tu Pokédex actualizada"
    static let subtitleOnboardingScreenTwo = "Regístrate y guarda tu perfil, tus pokémon favoritos, tu configuración y mucho más en la aplicación, incluso sin conexión a Internet."
    static let titleOnboardingScreenThree = "¿Estás listo para esta aventura?"
    static let subtitleOnboardingScreenThree = "Sólo tienes que crear una cuenta y empezar a explorar el mundo Pokémon hoy mismo."
    static let titleCreateAccountScreen = "Falta poco para explorar este mundo."
    static let subtitleCreateAccountScreen = "¿Cómo quieres conectar?"
    static let createAccount = "Crear cuenta"
    static let whatIsYourMail = "Cual es tu email?"
    static let createCredentials = "Crea una contraseña"
    static let confirmCredentials = "Confirma tu contraseña"
    static let mail = "Correo"
    static let invalidMail = "Utilice una dirección de correo electrónico válida."
    static let credential = "Contraseña"
    static let invalidCredential = "La contraseña debe tener minimo 8 caracteres."
    static let invalidConfirmCredential = "Las contraseñas deben coincidir."
    static let titleAccountCreateSuccess = "Su cuenta ha sido creada con exito!"
    static let subTitleAccountCreateSuccess = "Sea bienvenido a este increible mundo Pokemon"
    static let titleLoginScreen = "Que bueno verte por aqui nuevamente."
    static let subtitleLoginScreen = "¿Cómo deseas conectar?"
    static let signIn = "Entrar"
    static let titleAuthenticationLogin = "Bienvenido de vuelta!"
    static let subtitleAuthenticationLogin = "Completa los datos"
    static let titleLoginSuccess = "Bienvenido de vuelta, Entrenador!"
    static let subtitleLoginSuccess = "Esperamos que hayas tenido muchas aventuras desde la ultima vez que nos vimos."
    
}

struct regionsPokemon {
    
    static let region: [String] = ["Kanto", "Johto", "Hoenn", "Sinnoh", "Unova", "Kalos", "Alola", "Galar"]
}
