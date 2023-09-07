//
//  PokemonCell.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import SwiftUI

struct PokemonCell: View {
    
    @ObservedObject var pokemonListViewModel: PokemonListViewModel = PokemonListViewModel(pokemonRepository: PokemonRepository())
    @State var countTypes: Int
    @State var id: Int
    @State var name: String
    @State var type: [String]
    @State var pokemonSprite: String
    @State var entityData: PokemonEntity?
    @State var coreData: Bool = false
    
    var body: some View {
        
        ZStack {
            
            HStack {
                VStack {
                    HStack {
                        Text(coreData ? pokemonListViewModel.getNumPokedex(id: Int(entityData?.id ?? Int32(0))) : pokemonListViewModel.getNumPokedex(id: id))
                            .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.033))
                        .padding(.top)
                        Spacer()
                    }
                    .padding(.leading)
                    HStack {
                        Text(coreData ? entityData?.name ?? "" : name)
                            .font(.custom(Fonts.poppinsBold, size: framesUI.width * 0.058))
                        .padding(.bottom, framesUI.height * -0.001)
                        Spacer()
                    }
                    .padding(.leading)
                    HStack {
                        ZStack {
                            HStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width: framesUI.width * 0.055, height: framesUI.height * 0.025)
                                    pokemonListViewModel.getImageType(type: coreData ? entityData?.type ?? "" : type[0])
                                        .resizable()
                                        .frame(width: framesUI.width * 0.036, height: framesUI.height * 0.016)
                                        .foregroundColor(pokemonListViewModel.getColor(type: coreData ? entityData?.type ?? "" : type[0]))
                                }
                                .padding(.leading, framesUI.width * 0.02)
                                
                                Text(coreData ? entityData?.type ?? "" : type[0])
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.033))
                                    .padding(.trailing, framesUI.width * 0.02)
                            }
                        }
                        .frame(height: framesUI.height * 0.0325)
                        .background(coreData ? pokemonListViewModel.getColor(type: entityData?.type ?? "") : pokemonListViewModel.getColor(type: type[0]))
                        .cornerRadius(48.6)
                        
                        if coreData ? entityData?.type2 != "" : type[1] != ""  {
                            
                            ZStack {
                                HStack {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.white)
                                            .frame(width: framesUI.width * 0.055, height: framesUI.height * 0.025)
                                        pokemonListViewModel.getImageType(type: coreData ? entityData?.type2 ?? "" : type[1])
                                            .resizable()
                                            .frame(width: framesUI.width * 0.036, height: framesUI.height * 0.016)
                                            .foregroundColor(coreData ? pokemonListViewModel.getColor(type: entityData?.type2 ?? "") : pokemonListViewModel.getColor(type: type[1]))
                                    }
                                    .padding(.leading, framesUI.width * 0.02)
                                    
                                    Text(coreData ? entityData?.type2 ?? "" : type[1])
                                        .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.033))
                                        .padding(.trailing, framesUI.width * 0.02)
                                }
                            }
                            .frame(height: framesUI.height * 0.0325)
                            .background(coreData ? pokemonListViewModel.getColor(type: entityData?.type2 ?? "") : pokemonListViewModel.getColor(type: type[1]))
                            .cornerRadius(48.6)
                        }
                        
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.bottom)
                }
                .frame(width: framesUI.width * 0.56, height: framesUI.height * 0.1275)
                
                HStack {
                    Spacer()
                    ZStack{
                        
                        pokemonListViewModel.getImageType(type: coreData ? entityData?.type ?? "" : type[0])
                            .resizable()
                            .frame(width: framesUI.width * 0.23, height: framesUI.height * 0.1125)
                            .foregroundColor(.white.opacity(0.7))
                        
                        AsyncImage(url: URL(string: pokemonSprite))
                    }
                    .frame(width: framesUI.width * 0.32, height: framesUI.height * 0.1275)
                    .background(coreData ? pokemonListViewModel.getColor(type: entityData?.type ?? "") : pokemonListViewModel.getColor(type: type[0]))
                    .cornerRadius(15)
                }
                
            }
        }
        .frame(width: framesUI.width * 0.93, height: framesUI.height * 0.1275)
        .background(coreData ? pokemonListViewModel.getColor(type: entityData?.type ?? "").opacity(0.5) : pokemonListViewModel.getColor(type: type[0]).opacity(0.5))
        .cornerRadius(15)
    }
}


struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(countTypes: 2, id: 1, name: "Bulbasur", type: ["poison","fighting"], pokemonSprite: "")
    }
}


