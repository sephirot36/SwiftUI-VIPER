//
//  PokemonListPresenter.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import Combine

protocol PokemonListPresenter: ObservableObject {
    var screenState: PokemonListScreenState { get set }
    var pokemonList: PokemonListViewModel { get set }
    
    func loadPokemons()
    func loadPokemonDetail(id: String)
    func goToFavorites()
}

enum PokemonListScreenState {
    case loading
    case error
    case empty
    case content
}

final class PokemonListPresenterDefault {
    
    @Published var screenState: PokemonListScreenState = .loading
    @Published var pokemonList: PokemonListViewModel = .empty()
    
    private let getPokemonInteractor: GetPokemonListInteractor
    private let router: PokemonListRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        getPokemonInteractor: GetPokemonListInteractor,
        router: PokemonListRouter
    ) {
        self.getPokemonInteractor = getPokemonInteractor
        self.router = router
        
        loadPokemons()
    }
}

extension PokemonListPresenterDefault: PokemonListPresenter {
    
    func loadPokemons() {
        screenState = .loading
        getPokemonInteractor.execute()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.screenState = .error
                    case .finished:
                        break
                    }
                },
                receiveValue: { pokemonList in
                    self.pokemonList = PokemonListViewModelMapper.map(pokemonList)
                    self.screenState = self.pokemonList.pokemon.isEmpty ? .empty : .content
                }
            )
            .store(in: &cancellables)
    }
    
    func loadPokemonDetail(id: String) {
        router.navigateToPokemonDetail(id: id)
    }
    
    func goToFavorites() {
        router.navigateToFavorites()
    }
}

// Mark: - Mock
final class PokemonListPresenterMock: PokemonListPresenter {
    
    var screenState: PokemonListScreenState = .content
    var pokemonList: PokemonListViewModel = .empty()
    
    init(pokemonList: [Pokemon]) {
        self.pokemonList = PokemonListViewModelMapper.map(pokemonList)
    }
    
    func loadPokemons() {}
    
    func loadPokemonDetail(id: String) {}
    
    func goToFavorites() {}
}
