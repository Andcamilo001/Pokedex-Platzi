//
//  PokemonDomain.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation

struct PokemonDomain: Equatable {
    
    let id: Int
    let name: String
    let sprite: String
    let type: [String]
}
