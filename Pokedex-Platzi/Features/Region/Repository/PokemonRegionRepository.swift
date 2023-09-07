//
//  PokemonRegionRepository.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 7/09/23.
//

import Foundation

protocol PokemonRegionRepositoryProtocol {
    func fetchPokemon(id: Int) async throws -> Pokemon
    func fetchRegionPokemons(i: Int, n: Int) async throws -> [PokemonRegionDomain]
}

class PokemonRegionRepository: PokemonRegionRepositoryProtocol {

    func fetchPokemon(id: Int) async throws -> Pokemon {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                throw NetworkError.requestFailed
            }

            guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {
                throw NetworkError.invalidResponse
            }
            
            return pokemon
        } catch {
            print("Error fetching Pokemon with ID \(id): \(error.localizedDescription)")
            throw error
        }
    }
    
    func fetchRegionPokemons(i: Int, n: Int) async throws -> [PokemonRegionDomain] {
        var pokemons: [PokemonRegionDomain] = []
            
        let x = i + 50
        
            for id in i...x {
                let pokemon = try await fetchPokemon(id: id)
                pokemons.append(PokemonRegionDomain(id: pokemon.id, name: pokemon.name, sprite: pokemon.sprites.frontDefault, type: [pokemon.types[0].type.name, pokemon.types[safe: 1]?.type.name ?? ""]))
            }
            
        return pokemons
    }
}
