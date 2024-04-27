//
//  MainConfigurator.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import Foundation

struct MainConfigurator {
    
    static var initialViewController: NavigationController {
        initialScreen()
    }
}

private extension MainConfigurator {
    
    static func initialScreen() -> NavigationController {
        let navController = NavigationController()
        let viewController = PokemonListConfigurator(navigationController: navController).viewController()
        navController.viewControllers = [viewController]
        
        return navController
    }
}

