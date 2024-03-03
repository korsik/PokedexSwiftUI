//
//  PokedexView.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 15/1/22.
//

import SwiftUI

struct PokedexView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var isFilterApplied = false
    @State private var isMenuOpen = false
    @State private var rotateImage = false
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 15) {
                        ForEach(viewModel.pokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailsView(pokemon: pokemon, color: Color(viewModel.backgroundColor(forType: pokemon.type)))) {
                                PokemonCell(pokemon: pokemon, viewModel: viewModel)
                            }
                            
                            
                        }
                    }
                }
                .navigationTitle("Pokedex")
                
                // ToDo: Create More Buttons to filter each type of pokemon
                HStack(alignment: .bottom) {
                    VStack(alignment: .trailing) {
                        if(self.isMenuOpen) {
                            ForEach(viewModel.pokemonTypes, id: \.self) { type in
                                let pokemonType = viewModel.pokemonType(forType: type)
                                
                                CircleImage(icon: pokemonType.imageUrl, radius: 30, color: pokemonType.color, rotateImage: PokemonViewModel.$defaultFalse)
                                    .offset(x: 130)
                                    .onTapGesture {
                                        print("Yolanda")
                                        isMenuOpen.toggle()
                                        isFilterApplied.toggle()
                                        viewModel.pokemon = viewModel.pokemon.filter({$0.type == type})
                                        
                                        
                                    }
                            }
                        }
                        CircleImage(icon: isFilterApplied ? "arrow.triangle.2.circlepath" : viewModel.pokemonType(forType: "").imageUrl, radius: 30, color: viewModel.pokemonType(forType: "").color, rotateImage: $rotateImage)
                            .offset(x: 130, y: self.isMenuOpen ? 0 : 270)
                            .onTapGesture {
                                if (isFilterApplied) {
                                    isFilterApplied.toggle()
                                    viewModel.fetchPokemon()
                                    self.rotateImage.toggle()
                                }
                                else {
                                    self.isMenuOpen.toggle()
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        self.rotateImage.toggle()
                                    }
                                }
                            }
                    }
                }
            }
        }
        .accentColor(Color(.label))
        .navigationTitleTextColor(.orange)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
