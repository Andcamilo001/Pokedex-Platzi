//
//  ProfileView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 7/09/23.
//

import SwiftUI

struct ProfileView: View {
    @State var image: String = "Profile"
    @State var title: String = "Esta parte esta en construccion"
    @State var subtitle: String = "Esperamos entregarte muchas funcionalidades pronto en tu perfil."
    @State var textButton: String = "Cerrar Sesion"
    @State var textButtonWhite: String = "Borrar datos almacenados"
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel()
    @FetchRequest(
        entity: PokemonEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \PokemonEntity.id, ascending: true)  ]) var pokemons: FetchedResults<PokemonEntity>
    @Environment(\.managedObjectContext) private var context
    @Binding var createAccount: Bool
    @Binding var login: Bool
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                VStack {
                    
                    Image(image)
                        .frame(width: framesUI.width * 0.83, height: framesUI.height * 0.3225)
                    
                    Text(title)
                        .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(width: framesUI.width * 0.91)
                        .padding()
                    
                    Text(subtitle)
                        .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.038))
                        .multilineTextAlignment(.center)
                        .frame(width: framesUI.width * 0.91)
                        .padding()
                    
                    
                    Button(action: {
                        authenticationViewModel.logOut()
                        createAccount = false
                        login = false
                    }) {
                        ZStack {
                            
                            Text(textButton)
                                .font(.custom(Fonts.poppinsBold, size: framesUI.width * 0.05))
                                .foregroundColor(.white)
                        }
                        .frame(width: framesUI.width * 0.91, height: framesUI.height * 0.0725)
                        .background(PokedexColors.buttonsBlue)
                        .cornerRadius(50)
                    }
                    .padding()
                    
                    Button(action: {
                        do{
                            pokemons.forEach { (pokemon) in
                                context.delete(pokemon)
                            }
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Borrar datos almacenados")
                            .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.05))
                            .foregroundColor(PokedexColors.buttonsBlue)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PokedexColors.backgroundWhite)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

