//
//  TestingCoreData.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import SwiftUI

struct TestingCoreData: View {
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(
        entity: PokemonEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \PokemonEntity.id, ascending: true)  ]) var pokemons: FetchedResults<PokemonEntity>
    
    var body: some View {
        VStack {
            if pokemons.isEmpty {
                Text("Core data vacio ")
            } else {
               
                VStack {
                    
                    Button(action: {
                        
                        do
                        {
                            pokemons.forEach { (pokemon) in
                                context.delete(pokemon)
                            }
                            try context.save()
                        }
                        catch
                        {
                            print(error.localizedDescription)
                        }
                        
                    }) {
                        Text("delete")
                    }
                    
                    List(pokemons) { pokemon in
                        
                        Text(pokemon.name ?? "")
                        Text(pokemon.id.description)
                        
                    }
                }
            }
        }
    }
}

struct TestingCoreData_Previews: PreviewProvider {
    static var previews: some View {
        TestingCoreData()
    }
}
