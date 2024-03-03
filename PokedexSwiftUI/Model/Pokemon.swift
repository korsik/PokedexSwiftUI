//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 15/1/22.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let height: Int
    let attack: Int
    let defense: Int
    let weight: Int
    
    func getTotal() -> Float {
        return (Float(attack) * 0.5 + Float(defense) * 0.5 + Float(height))
    }
}
