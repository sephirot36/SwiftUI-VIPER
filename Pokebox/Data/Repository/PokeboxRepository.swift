//
//  PokeboxRepository.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Combine

protocol PokeboxRepository {
    func getPokemonList() -> AnyPublisher<PokemonListEntity, DataError>
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError>
}

final class PokeboxRepositoryDefault {

    private let remote: PokemonRemoteDataSource
    
    init(remoteDataSource: PokemonRemoteDataSource) {
        remote = remoteDataSource
    }
}

extension PokeboxRepositoryDefault: PokeboxRepository {
    
    func getPokemonList() -> AnyPublisher<PokemonListEntity, DataError> {
        remote.getPokemonList()
    }
    
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        remote.getPokemonDetail(id: id)
    }
}
