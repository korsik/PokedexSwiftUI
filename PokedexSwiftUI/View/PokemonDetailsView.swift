//
//  PokemonDetailsView.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 16/1/22.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsView: View {
    let pokemon: Pokemon
    let color: Color
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                color
                VStack {
                    Spacer(minLength: geometry.size.height * 0.25)
                    ZStack {
                        RoundedRectangle(cornerRadius: 35)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        VStack {
                            Text(pokemon.name.capitalized)
                                .font(.title).bold()
                            Text(pokemon.type)
                                .font(.subheadline).bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(color)
                                .cornerRadius(25)
                                .frame(width: 90, height: 24)
                            
                            ScrollView {
                                Text(pokemon.description)
                                    .padding(.horizontal, 15)
                            }
                            .padding(.vertical, 15)
                            .frame(height: geometry.size.height * 0.2)
                            
                            Text("Stats")
                                .font(.subheadline).bold()
                                .frame(width: geometry.size.width * 0.90, alignment: .bottomLeading)
                                .padding(.horizontal, 15)
                            VStack(alignment: .leading) {
                                StatLineView(title: "Height", color: .yellow, number: pokemon.height)
                                StatLineView(title: "Attack", color: .red, number: pokemon.attack)
                                StatLineView(title: "Defense", color: .blue, number: pokemon.defense)
                                StatLineView(title: "Weigth", color: .purple, number: pokemon.weight)
                                StatLineView(title: "Total", color: .green, number: Int(pokemon.getTotal()))
                            }
                           
                        }
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                }
                
                KFImage(URL(string: pokemon.imageUrl))
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 68, height: 68)
//                    .padding([.bottom, .trailing], 4)
//                Image(pokemon.imageUrl)
                    .offset(y: -geometry.size.height * 0.27)
            }
            .ignoresSafeArea()
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: Pokemon(id: 0, name: "Bulbasaur", imageUrl: "bulba", type: "poison", description: "The last decade has been revolutionary in the fields of virtual and augmented reality. With the introduction of the head mounted device Oculus Rift VR has became widely known and adopted by many. Some years after Pokemon Go launched on mobile devices and became a massive success in the field of AR. ", height: 7, attack: 52, defense: 43, weight: 85), color: .blue)
    }
}
