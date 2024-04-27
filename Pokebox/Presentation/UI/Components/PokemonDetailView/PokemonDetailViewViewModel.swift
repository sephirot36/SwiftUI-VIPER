//
//  PokemonDetailViewViewModel.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import SwiftUI

struct PokemonDetailViewViewModel {
    
    let number: Int
    let name: String
    let imageURL: String
    let height: Float
    let weight: Float
    
    var formatedNumber: String {
        String(format: "%03d", number)
    }
}

struct PokemonStatDetailViewViewModel {
    
    let name: String
    let value: Int
    
    var nameFormated: String {
        name.replacingOccurrences(of: "-", with: " ")
    }
}

extension PokemonDetailViewViewModel {
    
    static func empty() -> Self {
        .init(
            number: 0,
            name: "",
            imageURL: "",
            height: 0,
            weight: 0
        )
    }
    
    static func mock() -> Self {
        .init(
            number: 4,
            name: "Charmander",
            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
            height: 6,
            weight: 85
        )
    }
}
