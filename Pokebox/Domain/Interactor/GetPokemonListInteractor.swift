//
//  GetPokemonListInteractor.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Combine

protocol GetPokemonListInteractor {
    func execute() -> AnyPublisher<[Pokemon], PokemonError>
}

final class GetPokemonListInteractorDefault {
    
    private let repository: PokeboxRepository
    
    init(repository: PokeboxRepository) {
        self.repository = repository
    }
}

extension GetPokemonListInteractorDefault: GetPokemonListInteractor {
    
    func execute() -> AnyPublisher<[Pokemon], PokemonError> {
        repository.getPokemonList()
            .map { $0.results.map { PokemonMapper.map($0) } }
            .mapError { PokemonErrorMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
