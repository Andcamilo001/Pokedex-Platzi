//
//  ErrorConectionView.swift
//  Pokedex-Platzi
//
//  Created by Andres Camilo Lezcano Restrepo on 7/09/23.
//

import SwiftUI

struct ErrorConectionView: View {
    @State var page: Int = 1
    @State var image: String = "Magikarp"
    @State var title: String = "Error de Conexion"
    @State var subtitle: String = "Revisa tu conexion a internet e intentalo nuevamente en un rato"
    @Environment(\.presentationMode) var errorConectionMode
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        errorConectionMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .accentColor(.black)
                        
                    }
                    .padding(.leading)
                    Spacer()
                }
                .padding(.top, framesUI.height * -0.22)
                
                Image(image)
                    .resizable()
                    .frame(width: framesUI.width * 0.59, height: framesUI.height * 0.3225)
                
                Text(title)
                    .font(.custom(Fonts.poppinsSemiBold, size: framesUI.width * 0.0725))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: framesUI.width * 0.91, height: 40)
                    .padding()
                
                Text(subtitle)
                    .font(.custom(Fonts.poppinsRegular, size: framesUI.width * 0.038))
                    .multilineTextAlignment(.center)
                    .frame(width: framesUI.width * 0.91)
                    .padding()
        
            }
            .padding(.top, framesUI.height * 0.04)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PokedexColors.backgroundWhite)
    }
}


struct ErrorConectionView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorConectionView()
    }
}
