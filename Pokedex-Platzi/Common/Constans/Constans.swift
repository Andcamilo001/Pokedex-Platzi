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
}
