//
//  PokemonListModel.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites, types
    }
}

struct Sprites: Codable {
    let frontDefault: String
    let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: Species
}

struct Species: Codable {
    let name: String
    let url: String
}

struct PokemonList: Codable {
    let list: [Pokemon]
}
