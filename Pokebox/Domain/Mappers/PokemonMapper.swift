//
//  PokemonMapper.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct PokemonMapper {
    
    static func map(_ entity: PokemonEntity) -> Pokemon {
        .init(
            name: entity.name ?? "",
            url: entity.url ?? ""
        )
    }
}
