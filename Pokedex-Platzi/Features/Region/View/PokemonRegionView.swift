//
//  PokemonRegionView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 7/09/23.
//

import SwiftUI

struct PokemonRegionView: View {
    @ObservedObject var pokemonRegionViewModel: PokemonRegionViewModel = PokemonRegionViewModel(pokemonRegionRepository: PokemonRegionRepository())
    @State var region: String
    
    var body: some View {
        
        ZStack {
            if pokemonRegionViewModel.isInternetUnavailable() {
                
                ErrorConectionView()
                
            } else if pokemonRegionViewModel.isLoading {
                ZStack {
                    VStack {
                        GifImage(name: "pokeball")
                    }
                    .frame(width: framesUI.width * 0.65, height: framesUI.height * 0.35)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 245/255, green: 252/255, blue: 1))
            } else {
                
                List(pokemonRegionViewModel.pokemons, id: \.id) { pokemon in
                    
                    NavigationLink(destination: DetailPokemonView(id: pokemon.id)) {
                        PokemonCell(countTypes: pokemon.type.count, id: pokemon.id, name: pokemon.name, type: pokemon.type, pokemonSprite: pokemon.sprite)
                    }
                }
                .listStyle(.plain)
                .padding(.leading, framesUI.width * 0.05)
            }
        }
        .onAppear {
            pokemonRegionViewModel.fetchPokemons(i: pokemonRegionViewModel.getRangeI(region: region), n: pokemonRegionViewModel.getRangeN(region: region))
        }
    }
}
