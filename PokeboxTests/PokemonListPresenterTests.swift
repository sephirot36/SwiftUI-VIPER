//
//  PokemonListPresenterTests.swift
//  PokeboxTests
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import XCTest
import Foundation
import Combine
@testable import Pokebox

final class PokemonListPresenterTests: XCTestCase {

    var sut: PokemonListPresenterDefault!
    // Router
    let mockRouter = PokemonListRouterMock()
    
    // Interactor
    let getPokemonListInteractorMock = GetPokemonListInteractorMock()
    
    override func setUp() {
        super.setUp()
        sut = PokemonListPresenterDefault(
            getPokemonInteractor: getPokemonListInteractorMock,
            router: mockRouter
        )
    }
    
    func testLoadPokemons() {
        // When create sut
        // Then
        XCTAssertEqual(sut.pokemonList.pokemon.count, 2)
        XCTAssertEqual(sut.screenState, .content)
        
    }
    
    func testLoadPokemonDetail() {
        // When
        sut.loadPokemonDetail(id: "1")
        
        // Then
        XCTAssertTrue( mockRouter.navigateToPokemonDetailCalled)
    }
    
    func testGoToFavorites() {
        // When
        sut.goToFavorites()
        
        // Then
        XCTAssertTrue( mockRouter.navigateToFavoritesCalled)
    }

}
