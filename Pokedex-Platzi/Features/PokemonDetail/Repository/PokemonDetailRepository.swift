//
//  PokemonDetailRepository.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation
import Alamofire
import Combine

protocol PokemonDetailRepositoryProtocol {
    func getDetailPokemon(id: Int) -> AnyPublisher<PokemonDetailDomain, Error>
}

class PokemonDetailRepository: PokemonDetailRepositoryProtocol {
    
    
    func getDetailPokemon(id: Int) -> AnyPublisher<PokemonDetailDomain, Error> {
        
        return Future { promise in
            AF.request("https://pokeapi.co/api/v2/pokemon/\(id)",
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: nil)
            .responseDecodable(of: PokemonDetailResponse.self,
                               completionHandler: { response in
                switch response.result {
                case .success(let pokemonResponse):
                    promise(.success(PokemonDetailDomain(id: pokemonResponse.id, name: pokemonResponse.name, sprite: pokemonResponse.sprites.other?.home.frontDefault ?? "", type: [pokemonResponse.types[0].type.name, pokemonResponse.types.count == 2 ? pokemonResponse.types[1].type.name : ""], shinySprite: pokemonResponse.sprites.other?.home.frontShiny ?? "", weight: pokemonResponse.weight, height: pokemonResponse.height, experience: pokemonResponse.baseExperience, hability: pokemonResponse.abilities[0].ability.name, errorConection: false)))
                case .failure(_):
                    promise(.success(PokemonDetailDomain(id: 0, name: "", sprite: "", type: [], shinySprite: "", weight: 0, height: 0, experience: 0, hability: "", errorConection: true)))
                }
            })
        }
        .timeout(5.0, scheduler: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
}
