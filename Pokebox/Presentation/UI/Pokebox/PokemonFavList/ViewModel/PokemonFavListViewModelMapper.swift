//
//  PokemonFavListViewModelMapper.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import Foundation

struct PokemonFavListViewModelMapper {
    
    static func map(_ pokemonList: [FavoritePokemon]) -> PokemonFavListViewModel {
        .init(
            pokemon: pokemonList.map {
                .init(
                    number: $0.number,
                    name: $0.name,
                    imageURL: $0.imageURL,
                    favorite: $0.favorite
                )
            }
        )
    }
}

