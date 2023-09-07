//
//  PokemonDetailViewModel.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    
    
    private let pokemonDetailRepository : PokemonDetailRepositoryProtocol
    
    
    @Published var isLoading: Bool = false
    @Published var errorConection: Bool = false
    @Published var name: String = ""
    @Published var sprite: String = ""
    @Published var type: String = ""
    @Published var type2: String? = ""
    @Published var shinySprite: String = ""
    @Published var weight: Int = 0
    @Published var height: Int = 0
    @Published var experience: Int = 0
    @Published var hability: String = ""
    
    
    var cancellables = Set<AnyCancellable>()
    
    
    init(repository: PokemonDetailRepositoryProtocol) {
        self.pokemonDetailRepository = repository
    }
    
    func getDetailPokemon(id: Int) {
        isLoading = true
        pokemonDetailRepository.getDetailPokemon(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard self != nil else { return }
                    switch value {
                    case .failure :
                        print("error")
                    case .finished :
                        break
                    }
                },
                receiveValue: { [weak self] pokemonDomainResponse in
                    guard let self = self else { return }
                    if pokemonDomainResponse.errorConection  {
                        self.isLoading = false
                        self.errorConection = true
                    } else {
                        self.name = pokemonDomainResponse.name
                        self.sprite = pokemonDomainResponse.sprite
                        self.type = pokemonDomainResponse.type[0]
                        self.type2 = pokemonDomainResponse.type[1]
                        self.shinySprite = pokemonDomainResponse.shinySprite
                        self.weight = pokemonDomainResponse.weight
                        self.height = pokemonDomainResponse.height
                        self.experience = pokemonDomainResponse.experience
                        self.hability = pokemonDomainResponse.hability
                        self.isLoading = false
                    }
                    
                }
                
            ).store(in: &cancellables)
    }
}
