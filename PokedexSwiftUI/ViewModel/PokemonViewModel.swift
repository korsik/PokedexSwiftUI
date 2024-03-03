//
//  PokemonViewModel.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 15/1/22.
//

import SwiftUI


class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseurl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    let pokemonTypes = ["fire", "poison", "water", "electric", "psychic", "normal", "ground", "flying", "fairy"]
    
    @State static var defaultFalse = false
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseurl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
                    
                    DispatchQueue.main.async {
                        self.pokemon = pokemon
                    }
        }.resume()
    }
    
    func pokemonType(forType type: String) -> PokemonType {
        
        if let index = POKEMON_TYPES.firstIndex(where: {$0.name == type}) {
            return POKEMON_TYPES[index]
        }
        return PokemonType(id: 10, name: "", imageUrl: "flame", color: .systemIndigo)
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
            case "fire": return .systemRed
            case "poison": return .systemGreen
            case "water": return .systemBlue
            case "electric": return .systemYellow
            case "psychic": return .systemPurple
            case "normal": return .systemGray
            case "ground": return .systemBrown
            case "flying": return .systemTeal
            case "fairy": return .systemPink
            default: return .systemIndigo
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
