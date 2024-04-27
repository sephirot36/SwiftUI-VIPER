//
//  PokemonFavListViewModel.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import Foundation

struct PokemonFavListViewModel {
    
    let pokemon: [PokemonListItemViewModel]
    
    static func empty() -> Self {
        .init(pokemon: [])
    }
}
