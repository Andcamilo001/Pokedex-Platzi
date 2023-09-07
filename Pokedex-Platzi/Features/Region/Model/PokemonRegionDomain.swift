//
//  PokemonRegionDomain.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 7/09/23.
//

import Foundation


struct PokemonRegionDomain: Equatable {
    
    let id: Int
    let name: String
    let sprite: String
    let type: [String]
}
