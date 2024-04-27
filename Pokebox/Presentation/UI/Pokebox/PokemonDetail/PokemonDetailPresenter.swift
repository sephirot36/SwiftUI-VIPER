//
//  PokemonDetailPresenter.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import Combine

protocol PokemonDetailPresenter: ObservableObject {
    var screenState: PokemonDetailScreenState { get set }
    var pokemonDetail: PokemonDetailViewModel { get set }
    
    func loadPokemonDetail()
    func goBack()
    func addToFavorites()
}

enum PokemonDetailScreenState {
    case loading
    case error
    case empty
    case content
}

final class PokemonDetailPresenterDefault {
    
    @Published var screenState: PokemonDetailScreenState = .loading
    @Published var pokemonDetail: PokemonDetailViewModel = .empty()
    
    private let pokemonNumber: String
    private let getPokemonDetailInteractor: GetPokemonDetailInteractor
    private let router: PokemonDetailRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        pokemonNumber: String,
        getPokemonDetailInteractor: GetPokemonDetailInteractor,
        router: PokemonDetailRouter
    ) {
        self.pokemonNumber = pokemonNumber
        self.getPokemonDetailInteractor = getPokemonDetailInteractor
        self.router = router
    }
}

extension PokemonDetailPresenterDefault: PokemonDetailPresenter {
    
    func loadPokemonDetail() {
        screenState = .loading
        getPokemonDetailInteractor.execute(id: pokemonNumber)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.screenState = .error
                    case .finished:
                        break
                    }
                },
                receiveValue: { pokemonDetail in
                    self.pokemonDetail = PokemonDetailViewModelMapper.map(pokemonDetail)
                    self.screenState = .content
                }
            )
            .store(in: &cancellables)
    }
    
    func goBack() {
        router.navigateBack()
    }
    
    func addToFavorites() {
        let fav = FavoritePokemon(number: String(pokemonDetail.pokemon.number),
                                  name: pokemonDetail.pokemon.name,
                                  imageURL: pokemonDetail.pokemon.imageURL,
                                  favorite: true)
        
        getPokemonDetailInteractor.addFavorite(pokemon: fav)
    }
}

// Mark: - Mock
final class MockPokemonDetailPresenter: PokemonDetailPresenter {
    
    var screenState: PokemonDetailScreenState = .loading
    var pokemonDetail: PokemonDetailViewModel = .mock()
    
    init(pokemonDetail: PokemonDetailViewModel) {
        self.pokemonDetail = pokemonDetail
    }
    
    func loadPokemonDetail() {}
    
    func goBack() {}
    
    func addToFavorites() {}
}

