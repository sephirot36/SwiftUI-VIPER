//
//  Mocks.swift
//  PokeboxTests
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import Foundation
import Combine
@testable import Pokebox

// Mock interactor
final class GetPokemonListInteractorMock {}

extension GetPokemonListInteractorMock: GetPokemonListInteractor {
    
    func execute() -> AnyPublisher<[Pokemon], PokemonError> {
        // Simulamos la emisión de datos
        let mockPokemon = [Pokemon(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/4/"),
                           Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/4/")]
                return Just(mockPokemon)
                    .setFailureType(to: PokemonError.self)
                    .eraseToAnyPublisher()
    }
}


// Mock router
class PokemonListRouterMock {
    
    var navigateToPokemonDetailCalled: Bool
    var navigateToFavoritesCalled: Bool
    
    init() {
        self.navigateToPokemonDetailCalled = false
        self.navigateToFavoritesCalled = false
    }
}

extension PokemonListRouterMock: PokemonListRouter {
    
    func navigateToPokemonDetail(id: String) {
        navigateToPokemonDetailCalled = true
    }
    
    func navigateToFavorites() {
        navigateToFavoritesCalled = true
    }
}

// Repository
final class PokeboxRepositoryMock {}

extension PokeboxRepositoryMock: PokeboxRepository {
    
    func getPokemonList() -> AnyPublisher<PokemonListEntity, DataError> {
        
        let mockEntity = PokemonListEntity(count: 2, results: [PokemonEntity(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"),
                                                               PokemonEntity(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/4/")])
        // Simulamos la emisión de datos
                return Just(mockEntity)
                    .setFailureType(to: DataError.self)
                    .eraseToAnyPublisher()
    }
    
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        let mockEntity = PokemonDetailEntity(id: 5, name: "Charmander", sprites: nil, height: 10.0, weight: 10.0)
        // Simulamos la emisión de datos
                return Just(mockEntity)
                    .setFailureType(to: DataError.self)
                    .eraseToAnyPublisher()
    }
}

final class PokemonRemoteDataSourceMock: PokemonRemoteDataSource {
    
    func getPokemonList() -> AnyPublisher<PokemonListEntity, DataError> {
        let mockEntity = PokemonListEntity(count: 2, results: [PokemonEntity(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/4/"),
                                                               PokemonEntity(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/4/")])
        // Simulamos la emisión de datos
                return Just(mockEntity)
                    .setFailureType(to: DataError.self)
                    .eraseToAnyPublisher()
    }
    
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        let mockEntity = PokemonDetailEntity(id: 5, name: "Charmander", sprites: nil, height: 10.0, weight: 10.0)
        // Simulamos la emisión de datos
                return Just(mockEntity)
                    .setFailureType(to: DataError.self)
                    .eraseToAnyPublisher()
    }
}

