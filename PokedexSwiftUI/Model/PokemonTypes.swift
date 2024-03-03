//
//  PokemonTypes.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 3/3/24.
//

import Foundation
import SwiftUI

struct PokemonType: Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let color: UIColor
}

let POKEMON_TYPES: [PokemonType] = [
    .init(id: 0, name: "fire", imageUrl: "flame", color: .systemRed),
    .init(id: 1, name: "poison", imageUrl: "leaf", color: .systemGreen),
    .init(id: 2, name: "water", imageUrl: "drop", color: .systemBlue),
    .init(id: 3, name: "electric", imageUrl: "bolt", color: .systemYellow),
    .init(id: 4, name: "psychic", imageUrl: "figure.mind.and.body", color: .systemPurple),
    .init(id: 5, name: "normal", imageUrl: "moonphase.full.moon", color: .systemGray),
    .init(id: 6, name: "ground", imageUrl: "hurricane", color: .systemBrown),
    .init(id: 7, name: "flying", imageUrl: "bird", color: .systemTeal),
    .init(id: 8, name: "fairy", imageUrl: "sparkles", color: .systemPink),
    .init(id: 9, name: "", imageUrl: "line.3.horizontal.decrease", color: .systemIndigo),
]
