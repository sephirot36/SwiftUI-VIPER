//
//  PokemonFavListPresenter.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import Combine

protocol PokemonFavListPresenter: ObservableObject {
    var screenState: PokemonFavListScreenState { get set }
    var pokemonFavList: PokemonFavListViewModel { get set }
    
    func loadPokemons()
    func goBack()
    func deleteFavorite(id: String)
}

enum PokemonFavListScreenState {
    case loading
    case empty
    case content
}

final class PokemonFavListPresenterDefault {
    
    @Published var screenState: PokemonFavListScreenState = .loading
    @Published var pokemonFavList: PokemonFavListViewModel = .empty()
    
    private let getPokemonFavListInteractor: GetFavPokemonListInteractor
    private let router: PokemonFavListRouter
    
    init(
        getPokemonFavListInteractor: GetFavPokemonListInteractor,
        router: PokemonFavListRouter
    ) {
        self.getPokemonFavListInteractor = getPokemonFavListInteractor
        self.router = router
        
        loadPokemons()
    }
}

extension PokemonFavListPresenterDefault: PokemonFavListPresenter {
    
    func loadPokemons() {
        screenState = .loading
        
        let favorites = getPokemonFavListInteractor.fetchData()
        
        self.pokemonFavList = PokemonFavListViewModelMapper.map(favorites)
        self.screenState = self.pokemonFavList.pokemon.isEmpty ? .empty : .content
    }
    
    func goBack() {
        router.navigateBack()
    }
    
    func deleteFavorite(id: String) {
        getPokemonFavListInteractor.deleteItem(id: id)
        loadPokemons()
    }
}

// Mark: - Mock
final class PokemonFavListPresenterMock: PokemonFavListPresenter {
    var screenState: PokemonFavListScreenState = .content
    var pokemonFavList: PokemonFavListViewModel = .empty()
    
    init(favPokemonList: [FavoritePokemon]) {
        self.pokemonFavList = PokemonFavListViewModelMapper.map(favPokemonList)
    }
    
    func loadPokemons() {}
    
    func goBack() {}
    
    func deleteFavorite(id: String) {}
}

