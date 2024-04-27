//
//  PokemonDetailViewModel.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import Foundation

struct PokemonDetailViewModel {
    
    let pokemon: PokemonDetailViewViewModel
}

extension PokemonDetailViewModel {
    
    static func empty() -> Self {
        .init(pokemon: .empty())
    }
    
    static func mock() -> Self {
        .init(pokemon: .mock())
    }
}
