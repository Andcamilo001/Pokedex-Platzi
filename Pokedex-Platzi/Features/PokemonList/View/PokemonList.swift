//
//  PokemonList.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var pokemonListViewModel: PokemonListViewModel
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        entity: PokemonEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \PokemonEntity.id, ascending: true)  ]) var pokemons: FetchedResults<PokemonEntity>
    
    var body: some View {
        
        if pokemonListViewModel.isInternetUnavailable() {
            
            List(pokemons) { pokemon in
               
                NavigationLink(destination: DetailPokemonView(id: Int(pokemon.id))) {
                    PokemonCell(countTypes: Int(pokemon.id), id: Int(pokemon.id), name: pokemon.name ?? "", type: [], pokemonSprite: "", entityData: pokemon, coreData: true)
                }
            }
            .listStyle(.plain)
            .padding(.leading, framesUI.width * 0.05)
            
        } else if pokemonListViewModel.isLoading {
            ZStack {
                VStack {
                    GifImage(name: "pokeball")
                }
                .frame(width: framesUI.width * 0.65, height: framesUI.height * 0.35)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 245/255, green: 252/255, blue: 1))
        } else {
            
                List(pokemonListViewModel.pokemons, id: \.id) { pokemon in
                    
                    NavigationLink(destination: DetailPokemonView(id: pokemon.id)) {
                        PokemonCell(countTypes: pokemon.type.count, id: pokemon.id, name: pokemon.name, type: pokemon.type, pokemonSprite: pokemon.sprite)
                            .onAppear {
                                if pokemon == pokemonListViewModel.pokemons.last {
                                    pokemonListViewModel.fetchAllPokemons(context: context)
                                    pokemonListViewModel.i = pokemonListViewModel.n + 1
                                    pokemonListViewModel.n = pokemonListViewModel.n + 15
                                }
                        }
                    }
                }
                .listStyle(.plain)
                .padding(.leading, framesUI.width * 0.05)
        }
    }
}

