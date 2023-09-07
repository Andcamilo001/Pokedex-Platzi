//
//  RegionView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 7/09/23.
//

import SwiftUI

struct RegionView: View {
    
    @State var regions: [String] = regionsPokemon.region
    
    var body: some View {
        
        List(regions, id: \.self) { region in
            
            NavigationLink(destination: PokemonRegionView(region: region)) {
                Image(region)
            }
        }
        .listStyle(.plain)
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView()
    }
}
