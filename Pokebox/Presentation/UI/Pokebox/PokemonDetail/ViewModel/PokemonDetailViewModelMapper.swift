//
//  PokemonDetailViewModelMapper.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import Foundation

struct PokemonDetailViewModelMapper {
    
    static func map(_ pokemonDetail: PokemonDetail) -> PokemonDetailViewModel {
        .init(
            pokemon: .init(
                number: pokemonDetail.number,
                name: pokemonDetail.name,
                imageURL: pokemonDetail.imageUrl,
                height: pokemonDetail.height,
                weight: pokemonDetail.weight
            )
        )
    }
}
