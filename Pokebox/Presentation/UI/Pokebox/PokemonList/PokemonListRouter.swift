//
//  PokemonListRouter.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import Foundation

protocol PokemonListRouter {
    func navigateToPokemonDetail(id: String)
    func navigateToFavorites()
}

final class PokemonListDefaultRouter {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension PokemonListDefaultRouter: PokemonListRouter {
    
    @MainActor func navigateToPokemonDetail(id: String) {
        guard let navigationController else {
            return
        }
        let viewController = PokemonDetailConfigurator(navigationController: navigationController).viewController(pokemonNumber: id)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    @MainActor func navigateToFavorites() {
        guard let navigationController else {
            return
        }
        let viewController = PokemonFavListConfigurator(navigationController: navigationController).viewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
