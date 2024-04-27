//
//  PokemonDetailMapper.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct PokemonDetailMapper {
    
    static func map(_ entity: PokemonDetailEntity) -> PokemonDetail {
        .init(
            number: entity.id ?? 0,
            name: entity.name ?? "",
            imageUrl: entity.sprites?.other.officialArtwork.frontDefault ?? "",
            height: entity.height ?? 0,
            weight: entity.weight ?? 0
        )
    }
}
