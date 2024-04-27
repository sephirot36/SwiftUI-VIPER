//
//  GetPokemonListRequest.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct GetPokemonListRequest: BaseEntity {
    
    var limit: String = "60"
    var offset: String = "0"
}

