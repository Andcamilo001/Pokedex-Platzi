//
//  PokeexListViewModel.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation
import SwiftUI
import CoreData
import Alamofire

class PokemonListViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonDomain] = []
    @Published var isLoading: Bool = false
    @Published var errorConectionData: Bool = false
    @Published var i: Int = 22
    @Published var n: Int = 32
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func fetchPokemons(context: NSManagedObjectContext) {
        
        isLoading = true
        
        Task {
            do {
                let pokemons = try await pokemonRepository.fetchFirstPokemons()
                DispatchQueue.main.async {
                    self.pokemons.append(contentsOf: pokemons)
                    self.saveData(context: context)
                    self.isLoading = false
                }
            } catch {
                print("error")
            }
        }
    }
    
    func fetchAllPokemons(context: NSManagedObjectContext) {
        
        Task {
            do {
                let pokemons = try await pokemonRepository.fetchAllPokemons(i: i, n: n)
                DispatchQueue.main.async {
                    self.pokemons.append(contentsOf: pokemons)
                    self.saveData(context: context)
                }
            } catch {
                print("error")

            }
        }
    }
    
    func isInternetUnavailable() -> Bool {
        let manager = NetworkReachabilityManager.default

        return !(manager?.isReachable ?? false)
    }
    
    func getColor(type: String) -> Color {
        switch type {
        case "grass":
            return Color.green
        case "fire":
            return Color.red
        case "water":
            return Color.blue
        case "electric":
            return Color.yellow
        case "bug":
            return Color(red: 145/255, green: 193/255, blue: 47/255)
        case "flying":
            return Color(red: 137/255, green: 170/255, blue: 227/255)
        case "normal":
            return Color(red: 145/255, green: 154/255, blue: 162/255)
        case "poison":
            return Color.purple
        case "ground":
            return Color(red: 217/255, green: 120/255, blue: 69/255)
        case "rock":
            return Color(red: 197/255, green: 183/255, blue: 140/255)
        case "fighting":
            return Color(red: 206/255, green: 65/255, blue: 107/255)
        case "psychic":
            return Color(red: 250/255, green: 113/255, blue: 121/255)
        case "ghost":
            return Color(red: 82/255, green: 105/255, blue: 173/255)
        case "ice":
            return Color(red: 115/255, green: 206/255, blue: 192/255)
        case "steel":
            return Color(red: 90/255, green: 142/255, blue: 162/255)
        case "dragon":
            return Color(red: 11/255, green: 109/255, blue: 195/255)
        case "dark":
            return Color(red: 90/255, green: 84/255, blue: 101/255)
        case "fairy":
            return Color(red: 236/255, green: 143/255, blue: 230/255)
        default:
            return .white
        }
    }
    
    func getImageType(type: String) -> Image {
        switch type {
        case "grass":
            return Image("Grass")
        case "fire":
            return Image("Fire")
        case "water":
            return Image("Water")
        case "electric":
            return Image("Electric")
        case "bug":
            return Image("Bug")
        case "flying":
            return Image("Fly")
        case "normal":
            return Image("Normal")
        case "poison":
            return Image("Poison")
        case "ground":
            return Image("Ground")
        case "rock":
            return Image("Rock")
        case "fighting":
            return Image("Fight")
        case "psychic":
            return Image("Pyschic")
        case "ghost":
            return Image("Ghost")
        case "ice":
            return Image("Ice")
        case "steel":
            return Image("Steel")
        case "dragon":
            return Image("Dragon")
        case "dark":
            return Image("Dark")
        case "fairy":
            return Image("Fairy")
        default:
            return Image("Grass")
        }
    }
    
    func getNumPokedex(id: Int) -> String {
        
        let num = id.description
        
        if id < 10 {
            
            return "Nº00" + num
            
        } else if id < 100 {
            
            return "Nº0" + num
            
        } else {
            
            return "Nº" + num
        }
    }
    
    func saveData(context: NSManagedObjectContext) {
        for data in pokemons {
            let fetchRequest: NSFetchRequest<PokemonEntity> = PokemonEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d", data.id)

            do {
                let existingPokemon = try context.fetch(fetchRequest).first

                if let existingPokemon = existingPokemon {
                    continue
                } else {
                    let entity = PokemonEntity(context: context)
                    entity.id = Int32(data.id)
                    entity.name = data.name
                    entity.type = data.type[0]
                    entity.type2 = data.type[1]
                    entity.imageBase64 = data.sprite
                }
            } catch {
                print("Error al buscar Pokémon existente: \(error.localizedDescription)")
            }
        }

        do {
            try context.save()
            print("Guardado exitoso")
        } catch {
            print("Error al guardar los datos: \(error.localizedDescription)")
        }
    }
}

enum ColorTypePokemon: String {
    case Grass = "grass"
    case Fire = "fire"
    case Water = "water"
    case Electric = "electric"
    case Bug = "bug"
    case Flying = "flying"
    case Normal = "normal"
    case Poison = "poison"
    case Ground = "ground"
    case Rock = "rock"
    case Fighting = "fighting"
    case Psychic = "psychic"
    case Ghost = "ghost"
    case Ice = "ice"
    case Steel = "steel"
    case Dragon = "dragon"
    case Dark = "dark"
    case Fairy = "fairy"
}
