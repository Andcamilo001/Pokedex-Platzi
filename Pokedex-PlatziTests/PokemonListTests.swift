//
//  PokemonListTests.swift
//  Pokedex-PlatziTests
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import XCTest
@testable import Pokedex_Platzi

final class PokemonListTests: XCTestCase {
    
    func testFetchPokemon() throws {
        
        let repository = MockPokemonNetwork()
        
        let expectedPokemon = Pokemon(id: 1, name: "bulbasaur", sprites: Sprites(frontDefault: ""), types: [TypeElement(slot: 1, type: Species(name: "grass", url: "")), TypeElement(slot: 2, type: Species(name: "poison", url: ""))])
        
        do {
            let pokemon = try repository.fetchPokemon(id: 1)
            XCTAssertEqual(pokemon.name, expectedPokemon.name)
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
    }
}
