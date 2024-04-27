//
//  PokemonStat.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct PokemonStat: BaseModel {
    
    let name: String
    let value: Int
    
    var nameFormated: String {
        name.replacingOccurrences(of: "-", with: " ")
    }
}
