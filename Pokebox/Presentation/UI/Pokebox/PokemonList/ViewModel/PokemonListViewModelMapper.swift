//
//  PokemonListViewModelMapper.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import Foundation

struct PokemonListViewModelMapper {
    
    static func map(_ pokemonList: [Pokemon]) -> PokemonListViewModel {
        .init(
            pokemon: pokemonList.map {
                .init(
                    number: $0.number,
                    name: $0.name,
                    imageURL: $0.imageURL, 
                    favorite: false
                )
            }
        )
    }
}

