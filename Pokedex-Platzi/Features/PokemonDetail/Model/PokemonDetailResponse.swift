//
//  PokemonDetailResponse.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation

struct PokemonDetailResponse: Codable {
    let abilities: [Ability]
    let baseExperience: Int
    let height: Int
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case height
        case id
        case name
        case sprites, types, weight
    }
}

struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct Other: Codable {
    let home: Home

    enum CodingKeys: String, CodingKey {
        case home
    }
}

struct Home: Codable {
    let frontDefault: String
    let frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
