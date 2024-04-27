//
//  PokemonDetail.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct PokemonDetail: BaseModel {
    
    let number: Int
    let name: String
    let imageUrl: String
    let height: Float
    let weight: Float
}

extension PokemonDetail: Equatable {
    
    static func == (lhs: PokemonDetail, rhs: PokemonDetail) -> Bool {
        lhs.number == rhs.number
    }
}

extension PokemonDetail {
    
    var isEmpty: Bool {
        number == 0
    }
}

extension PokemonDetail {
    
    static func empty() -> PokemonDetail {
        .init(
            number: 0,
            name: "",
            imageUrl: "",
            height: 0,
            weight: 0
        )
    }
    
    static func mock() -> PokemonDetail {
        .init(
            number: 4,
            name: "charmander",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
            height: 4,
            weight: 60
        )
    }
}
