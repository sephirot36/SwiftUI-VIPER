//
//  PokemonDetailRouter.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import Foundation

protocol PokemonDetailRouter {
    func navigateBack()
}

final class PokemonDetailRouterDefault {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension PokemonDetailRouterDefault: PokemonDetailRouter {
    
    func navigateBack() {
        guard let navigationController else {
            return
        }
        navigationController.popViewController(animated: true)
    }
}
