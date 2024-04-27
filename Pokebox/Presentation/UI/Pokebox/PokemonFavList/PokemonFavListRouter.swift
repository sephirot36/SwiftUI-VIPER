//
//  PokemonFavListRouter.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import Foundation

protocol PokemonFavListRouter {
    func navigateBack()
}

final class PokemonFavListRouterDefault {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension PokemonFavListRouterDefault: PokemonFavListRouter {
    
    func navigateBack() {
        guard let navigationController else {
            return
        }
        navigationController.popViewController(animated: true)
    }
}
