//
//  TabView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import SwiftUI

struct TabViewPokedex: View {
    @State private var selectedTab = 0
        
        var body: some View {
            
            TabView(selection: $selectedTab) {
      
                Text("Pestaña 1")
                    .tabItem {
                        Image(selectedTab == 0 ? stringToAssets.pokedexSelected : stringToAssets.pokedexUnselected)
                        Text(textButtons.tabOne)
                    }
                    .tag(0)
                
                Text("Pestaña 2")
                    .tabItem {
                        Image(selectedTab == 1 ? stringToAssets.regionSelected : stringToAssets.regionUnselected)
                        Text(textButtons.tabTwo)
                    }
                    .tag(1)

                Text("Pestaña 3")
                    .tabItem {
                        Image(selectedTab == 2 ? stringToAssets.favoritesSelected : stringToAssets.favoritesUnselected)
                        Text(textButtons.tabThree)
                    }
                    .tag(2)
                
                Text("Pestaña 3")
                    .tabItem {
                        Image(selectedTab == 3 ? stringToAssets.profileSelected : stringToAssets.profileUnselected)
                        Text(textButtons.tabFour)
                    }
                    .tag(3)
            }
        }
    }

struct TabViewPokedex_Previews: PreviewProvider {
    static var previews: some View {
        TabViewPokedex()
    }
}
