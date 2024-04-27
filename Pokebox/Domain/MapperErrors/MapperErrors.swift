//
//  MapperErrors.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct PokemonErrorMapper {
    static func map(_ error: DataError) -> PokemonError {
        switch error {
        default:
            return .undefined
        }
    }
}

struct PokemonDetailErrorMapper {
    static func map(_ error: DataError) -> PokemonDetailError {
        switch error {
        default:
            return .undefined
        }
    }
}
