//
//  GetPokemonDetailInteractor.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Combine
import SwiftData

protocol GetPokemonDetailInteractor {
    func execute(id: String) -> AnyPublisher<PokemonDetail, PokemonDetailError>
    func addFavorite(pokemon: FavoritePokemon)
}

final class GetPokemonDetailInteractorDefault {
    
    private let repository: PokeboxRepository
    private let modelContext: ModelContext
    
    init(repository: PokeboxRepository, modelContext: ModelContext) {
        self.repository = repository
        self.modelContext = modelContext
    }
}

extension GetPokemonDetailInteractorDefault: GetPokemonDetailInteractor {
    
    func execute(id: String) -> AnyPublisher<PokemonDetail, PokemonDetailError> {
        repository.getPokemonDetail(id: id)
            .map { PokemonDetailMapper.map($0) }
            .mapError { PokemonDetailErrorMapper.map($0) }
            .eraseToAnyPublisher()
    }
    
    func addFavorite(pokemon: FavoritePokemon) {
        modelContext.insert(pokemon)
    }
}
