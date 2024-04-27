//
//  PokemonRemoteDataSource.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation
import Combine

protocol PokemonRemoteDataSource {
    func getPokemonList() -> AnyPublisher<PokemonListEntity, DataError>
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError>
}

final class PokemonRemoteDataSourceDefault: PokemonRemoteDataSource {
    
    func getPokemonList() -> AnyPublisher<PokemonListEntity, DataError> {
        let request = GetPokemonListRequest()
        guard let request = API.Backend.PokeboxAPI.list(request: request).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
    
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        guard let request = API.Backend.PokeboxAPI.detail(id: id).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
}

