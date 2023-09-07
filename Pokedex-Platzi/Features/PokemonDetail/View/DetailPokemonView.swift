//
//  DetailPokemonView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 6/09/23.
//

import SwiftUI

struct DetailPokemonView: View {
    
    @ObservedObject var pokemonTypes: PokemonListViewModel = PokemonListViewModel(pokemonRepository: PokemonRepository())
    @ObservedObject var detailpokemonViewModel: PokemonDetailViewModel = PokemonDetailViewModel(repository: PokemonDetailRepository())
    @Environment(\.presentationMode) var detailPokemon
    @State var id: Int = 0
    
    
    var body: some View {
        
        NavigationView {
            if detailpokemonViewModel.isLoading {
                
                ZStack {
                    VStack {
                        GifImage(name: "pokeball")
                    }
                    .frame(width: framesUI.width * 0.65, height: framesUI.height * 0.35)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 245/255, green: 252/255, blue: 1))
                
            } else if detailpokemonViewModel.errorConection {
                ErrorConectionView()
            } else {
                
                    ScrollView {
                        VStack {
                            ZStack {
                                
                                Circle()
                                    .frame(width: framesUI.width * 1.38, height: framesUI.height * 0.68)
                                    .foregroundColor(pokemonTypes.getColor(type: detailpokemonViewModel.type))
                                    .padding(.top, framesUI.height * -0.4)
                                
                                HStack {
                                    
                                    Button(action: {
                                        detailPokemon.wrappedValue.dismiss()
                                    }) {
                                        Image(systemName: "chevron.left")
                                            .accentColor(.black)
                                        
                                    }
                                    .padding(.leading, framesUI.width * 0.25)
                                    Spacer()
                                }
                                .padding(.top, framesUI.height * -0.15)
                                
                                pokemonTypes.getImageType(type: detailpokemonViewModel.type)
                                    .resizable()
                                    .frame(width: framesUI.width * 0.436, height: framesUI.height * 0.215)
                                    .padding(.top, framesUI.height * -0.04)
                                    .foregroundColor(.white.opacity(0.8))
                                
                                AsyncImage(url: URL(string: detailpokemonViewModel.sprite)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .frame(width: framesUI.width * 0.436, height: framesUI.height * 0.215)
                                            .padding(.top, framesUI.height * 0.1)
                                    case .failure:
                                        Text("Error al cargar la imagen")
                                    @unknown default:
                                        Text("Algo salió mal")
                                    }
                                }
                            }
                            
                            HStack {
                                
                                Text(detailpokemonViewModel.name)
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.088))
                                Spacer()
                            }
                            .padding(.top)
                            .padding(.leading, framesUI.width * 0.23)
                            
                            HStack {
                                
                                Text(pokemonTypes.getNumPokedex(id: 1))
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.045))
                                Spacer()
                            }
                            .padding(.leading, framesUI.width * 0.24)
                            
                            HStack {
                                ZStack {
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .foregroundColor(.white)
                                                .frame(width: framesUI.width * 0.077, height: framesUI.height * 0.035)
                                            pokemonTypes.getImageType(type: detailpokemonViewModel.type)
                                                .resizable()
                                                .frame(width: framesUI.width * 0.05, height: framesUI.height * 0.025)
                                                .foregroundColor(pokemonTypes.getColor(type:detailpokemonViewModel.type))
                                        }
                                        .padding(.leading, framesUI.width * 0.02)
                                        
                                        Text(detailpokemonViewModel.type)
                                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.043))
                                            .padding(.trailing, framesUI.width * 0.03)
                                    }
                                }
                                .frame(height: framesUI.height * 0.045)
                                .background(pokemonTypes.getColor(type:detailpokemonViewModel.type))
                                .cornerRadius(48.6)
                                
                                if detailpokemonViewModel.type2 != ""  {
                                    
                                    ZStack {
                                        HStack {
                                            ZStack {
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: framesUI.width * 0.077, height: framesUI.height * 0.035)
                                                pokemonTypes.getImageType(type: detailpokemonViewModel.type2 ?? "")
                                                    .resizable()
                                                    .frame(width: framesUI.width * 0.05, height: framesUI.height * 0.025)
                                                    .foregroundColor( pokemonTypes.getColor(type: detailpokemonViewModel.type2 ?? ""))
                                            }
                                            .padding(.leading, framesUI.width * 0.02)
                                            
                                            Text(detailpokemonViewModel.type2 ?? "")
                                                .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.043))
                                                .padding(.trailing, framesUI.width * 0.03)
                                        }
                                    }
                                    .frame(height: framesUI.height * 0.045)
                                    .background(pokemonTypes.getColor(type: detailpokemonViewModel.type2 ?? ""))
                                    .cornerRadius(48.6)
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, framesUI.width * 0.24)
                            .padding(.bottom)
                            
                            VStack {
                                HStack {
                                    VStack {
                                        HStack {
                                            Image(systemName: "scalemass.fill")
                                            
                                            Text("Peso")
                                                .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.05))
                                            Spacer()
                                        }
                                        .padding(.leading, framesUI.width * 0.26)
                                        
                                        HStack {
                                            ZStack {
                                                Text("\(detailpokemonViewModel.weight) kg")
                                            }
                                            .frame(width: framesUI.width * 0.427, height: framesUI.height * 0.053)
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                            Spacer()
                                        }
                                        .padding(.leading, framesUI.width * 0.25)
                                        
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("Altura")
                                                .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.05))
                                            Image(systemName: "lineweight")
                                        }
                                        .padding(.trailing, framesUI.width * 0.43)
                                        
                                        HStack {
                                            Spacer()
                                            ZStack {
                                                Text("\(detailpokemonViewModel.height) m")
                                            }
                                            .frame(width: framesUI.width * 0.427, height: framesUI.height * 0.053)
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                        }
                                        .padding(.trailing, framesUI.width * 0.25)
                                        
                                    }
                                }
                                
                                HStack {
                                    VStack {
                                        HStack {
                                            Image(systemName: "pawprint.circle")
                                            
                                            Text("Experiencia")
                                                .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.05))
                                            Spacer()
                                        }
                                        .padding(.leading, framesUI.width * 0.26)
                                        
                                        HStack {
                                            ZStack {
                                                Text(detailpokemonViewModel.experience.description)
                                            }
                                            .frame(width: framesUI.width * 0.427, height: framesUI.height * 0.053)
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                            Spacer()
                                        }
                                        .padding(.leading, framesUI.width * 0.25)
                                        
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("Habilidad")
                                                .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.05))
                                            Image(systemName: "cloud.bolt")
                                        }
                                        .padding(.trailing, framesUI.width * 0.35)
                                        
                                        HStack {
                                            Spacer()
                                            ZStack {
                                                Text(detailpokemonViewModel.hability)
                                            }
                                            .frame(width: framesUI.width * 0.427, height: framesUI.height * 0.053)
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                        }
                                        .padding(.trailing, framesUI.width * 0.25)
                                        
                                    }
                                }
                            }
                            
                            HStack {
                                
                                Text("Shiny")
                                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.088))
                                Spacer()
                            }
                            .padding(.leading, framesUI.width * 0.23)
                            
                            AsyncImage(url: URL(string: detailpokemonViewModel.shinySprite)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .frame(width: framesUI.width * 0.536, height: framesUI.height * 0.315)
                                        .padding(.top, framesUI.height * 0.1)
                                case .failure:
                                    Text("Error al cargar la imagen")
                                @unknown default:
                                    Text("Algo salió mal")
                                }
                            }
                            .padding(.top, framesUI.height * -0.1)
                        }
                    }
            }
        }
        .onAppear {
            detailpokemonViewModel.getDetailPokemon(id: id)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

//struct DetailPokemonView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPokemonView()
//    }
//}
