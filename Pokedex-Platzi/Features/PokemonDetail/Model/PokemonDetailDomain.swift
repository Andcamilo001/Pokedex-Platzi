//
//  PokemonDetailDomain.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation

struct PokemonDetailDomain {
    
    let id: Int
    let name: String
    let sprite: String
    let type: [String]
    let shinySprite: String
    let weight: Int
    let height: Int
    let experience: Int
    let hability: String
    let errorConection: Bool
}
