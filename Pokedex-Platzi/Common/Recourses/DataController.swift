//
//  DataController.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Pokedex_Platzi")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("success")
        } catch {
            print("data not save")
        }
    }
    
    func addPokemon(id: Int32, name: String, type: String, type2: String, imageBase64: String, favorite: Bool, context: NSManagedObjectContext) {
        let pokemon = PokemonEntity(context: context)
        pokemon.id = id
        pokemon.name = name
        pokemon.type = type
        pokemon.type2 = type2
        pokemon.imageBase64 = imageBase64
        pokemon.favorite = favorite
        
        save(context: context)
    }
    
    func editPokemon(pokemon: PokemonEntity, id: Int32, name: String, type: String, type2: String, imageBase64: String, favorite: Bool, context: NSManagedObjectContext) {
        pokemon.id = id
        pokemon.name = name
        pokemon.type = type
        pokemon.type2 = type2
        pokemon.imageBase64 = imageBase64
        pokemon.favorite = favorite
        
        save(context: context)
    }
}
