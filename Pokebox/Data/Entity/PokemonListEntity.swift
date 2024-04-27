//
//  PokemonListEntity.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct PokemonListEntity: BaseEntity {
    
    let count: Int?
    let results: [PokemonEntity]
}

