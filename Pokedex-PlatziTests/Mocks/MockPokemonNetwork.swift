//
//  MockNetworkSimulator.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation

class MockPokemonNetwork {
    
    func fetchPokemon(id: Int) throws -> Pokemon {
        
        if let jsonFilePath = Bundle.main.path(forResource: "PokemonJson", ofType: "json"),
           let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) {
            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: jsonData)
                return pokemon
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                throw NetworkError.invalidResponse
            }
        } else {
            print("Error loading JSON file")
            throw NetworkError.invalidResponse
        }
    }
}
