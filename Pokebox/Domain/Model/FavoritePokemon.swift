//
//  FavoritePokemon.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import Foundation
import SwiftData

@Model
final class FavoritePokemon: Identifiable, Hashable {
    @Attribute(.unique) let id: UUID = UUID()
    let number: String
    let name: String
    let imageURL: String
    let favorite: Bool
    
    init(number: String, name: String, imageURL: String, favorite: Bool) {
        self.number = number
        self.name = name
        self.imageURL = imageURL
        self.favorite = favorite
    }
}

extension FavoritePokemon {
    
    static func mock() -> Self {
        .init(
            number: "4",
            name: "charmander",
            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
            favorite: true
        )
    }
    
    static func mockList() -> [FavoritePokemon] {
        [
            .init(
                number: "25",
                name: "pikachu",
                imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                favorite: true
            ),
            .init(
                number: "4",
                name: "charmander",
                imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
                favorite: true
            ),
            .init(
                number: "1",
                name: "bulbasur",
                imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                favorite: true
            )
        ]
    }
}
