//
//  PokemonDetailConfigurator.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import SwiftUI
import SwiftData

struct PokemonDetailConfigurator {
    
    private let navigationController: NavigationController
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    @MainActor func viewController(pokemonNumber: String) -> UIViewController {
        
        // ModelContainer
        let sharedModelContainer: ModelContainer = {
            let schema = Schema([
                FavoritePokemon.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        
        // Router
        let router = PokemonDetailRouterDefault(navigationController: navigationController)
        
        // Repository
        let dataSource = PokemonRemoteDataSourceDefault()
        let repository = PokeboxRepositoryDefault(remoteDataSource: dataSource)
        
        // ModelContext
        let modelContext = sharedModelContainer.mainContext
        
        // Interactor
        let getPokemonDetailInteractor = GetPokemonDetailInteractorDefault(repository: repository,
                                                                           modelContext: modelContext)
        
        // Presenter
        let presenter = PokemonDetailPresenterDefault(
            pokemonNumber: pokemonNumber,
            getPokemonDetailInteractor: getPokemonDetailInteractor,
            router: router
        )
        
        // View
        let view: some View = PokemonDetailsView<PokemonDetailPresenterDefault>().environmentObject(presenter)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}

