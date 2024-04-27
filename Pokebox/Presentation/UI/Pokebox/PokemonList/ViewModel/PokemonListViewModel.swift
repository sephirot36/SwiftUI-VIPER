//
//  PokemonList.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import Foundation

struct PokemonListViewModel {
    
    let pokemon: [PokemonListItemViewModel]
    
    static func empty() -> Self {
        .init(pokemon: [])
    }
}
