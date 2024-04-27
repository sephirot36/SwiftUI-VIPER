//
//  PokemonDetailEntity.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct PokemonDetailEntity: BaseEntity {
    
    let id: Int?
    let name: String?
    let sprites: Sprites?
    let height: Float?
    let weight: Float?
}

struct Sprites: BaseEntity {
    
    let other: Other
}

struct Other: BaseEntity {
    
    let officialArtwork: Artwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct Artwork: BaseEntity {
    
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonStatEntity: BaseEntity {
    
    let name: String
}
