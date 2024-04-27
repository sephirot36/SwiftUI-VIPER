//
//  GetPokemonListInteractorTests.swift
//  PokeboxTests
//
//  Created by Daniel Castro muñoz on 26/4/24.
//

import XCTest
import Foundation
import Combine
@testable import Pokebox

final class GetPokemonListInteractorTests: XCTestCase {

    var interactor: GetPokemonListInteractorDefault!
    
    let entity: PokemonListEntity = .init(
        count: 1,
        results: [.init(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")]
    )
    
    // Router
    let mockRepository = PokeboxRepositoryMock()
    
    override func setUp() {
        super.setUp()
        interactor = GetPokemonListInteractorDefault(repository: mockRepository)
    }
    
    func testLoadPokemons() {
        
        // When, Then
        _ = interactor.execute()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: {
                    XCTAssertEqual($0.first, PokemonMapper.map(self.entity.results.first!))
                }
            )
    }

}
