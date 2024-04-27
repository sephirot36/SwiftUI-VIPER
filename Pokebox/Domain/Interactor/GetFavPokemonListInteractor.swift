//
//  GetFavPokemonListInteractor.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import Combine
import SwiftUI
import SwiftData

protocol GetFavPokemonListInteractor {
    func fetchData() -> [FavoritePokemon]
    func deleteItem(id: String)
}

final class GetFavPokemonListInteractorDefault {
    
    private let modelContext: ModelContext
    private var pokemons: [FavoritePokemon] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
}

extension GetFavPokemonListInteractorDefault: GetFavPokemonListInteractor {
    
    func fetchData() -> [FavoritePokemon] {
        do {
            let descriptor = FetchDescriptor<FavoritePokemon>(sortBy: [SortDescriptor(\.name)])
            pokemons = try modelContext.fetch(descriptor)
            return pokemons
        } catch {
            print("Fetch failed")
        }
        return []
    }
    
    func deleteItem(id: String) {
        if let pokemonToDelete = pokemons.first(where: { $0.number == id }) {
            modelContext.delete(pokemonToDelete)
        }
    }
}

