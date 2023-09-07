//
//  TabView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import SwiftUI


struct TabViewPokedex: View {
    @State private var selectedTab = 0
    @ObservedObject var pokemonListViewModel: PokemonListViewModel = PokemonListViewModel(pokemonRepository: PokemonRepository())
    @Environment(\.managedObjectContext) var context
    @Binding var createAccount: Bool
    @Binding var login: Bool
        
        var body: some View {
            
            NavigationView {
                TabView(selection: $selectedTab) {
          
                    PokemonListView(pokemonListViewModel: pokemonListViewModel)
                        .tabItem {
                            Image(selectedTab == 0 ? stringToAssets.pokedexSelected : stringToAssets.pokedexUnselected)
                            Text(textButtons.tabOne)
                        }
                        .tag(0)
                    
                    RegionView()
                        .tabItem {
                            Image(selectedTab == 1 ? stringToAssets.regionSelected : stringToAssets.regionUnselected)
                            Text(textButtons.tabTwo)
                        }
                        .tag(1)

                    MultimediaView()
                        .tabItem {
                            Image(selectedTab == 2 ? stringToAssets.favoritesSelected : stringToAssets.favoritesUnselected)
                            Text(textButtons.tabThree)
                        }
                        .tag(2)
                    
                    ProfileView(createAccount: $createAccount, login: $login)
                        .tabItem {
                            Image(selectedTab == 3 ? stringToAssets.profileSelected : stringToAssets.profileUnselected)
                            Text(textButtons.tabFour)
                        }
                        .tag(3)
                }
                .onAppear {
                    pokemonListViewModel.fetchPokemons(context: context)
            }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
