//
//  PokemonListConfigurator.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import SwiftUI

struct PokemonListConfigurator {
    
    private let navigationController: NavigationController
   
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func viewController() -> UIViewController {
        // Router
        let router = PokemonListDefaultRouter(navigationController: navigationController)
        
        // Repository
        let dataSource = PokemonRemoteDataSourceDefault()
        let repository = PokeboxRepositoryDefault(remoteDataSource: dataSource)
        
        // Interactor
        let getPokemonListInteractor = GetPokemonListInteractorDefault(repository: repository)
        
        // Presenter
        let presenter = PokemonListPresenterDefault(
            getPokemonInteractor: getPokemonListInteractor,
            router: router
        )
        
        // View
        let view: some View = PokemonListView<PokemonListPresenterDefault>().environmentObject(presenter)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}
