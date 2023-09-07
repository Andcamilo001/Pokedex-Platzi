//
//  PokemonListRepository.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation
import CoreData


protocol PokemonRepositoryProtocol {
    func fetchPokemon(id: Int) async throws -> Pokemon
    func fetchFirstPokemons() async throws -> [PokemonDomain]
    func fetchAllPokemons(i: Int, n: Int) async throws -> [PokemonDomain]
}

class PokemonRepository: PokemonRepositoryProtocol {

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


    func fetchFirstPokemons() async throws -> [PokemonDomain] {
        var pokemons: [PokemonDomain] = []
            for id in 1...151 {
                let pokemon = try await fetchPokemon(id: id)
                pokemons.append(PokemonDomain(id: pokemon.id, name: pokemon.name, sprite: pokemon.sprites.frontDefault, type: [pokemon.types[0].type.name, pokemon.types[safe: 1]?.type.name ?? ""]))
            }
        
        return pokemons
    }
    
    func fetchAllPokemons(i: Int, n: Int) async throws -> [PokemonDomain] {
        var pokemons: [PokemonDomain] = []
        
        if i > 1281 {
            
        } else {
            
            for id in i...n {
                let pokemon = try await fetchPokemon(id: id)
                pokemons.append(PokemonDomain(id: pokemon.id, name: pokemon.name, sprite: pokemon.sprites.frontDefault, type: [pokemon.types[0].type.name, pokemon.types[safe: 1]?.type.name ?? ""]))
            }
        }
        
        return pokemons
    }
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
}
