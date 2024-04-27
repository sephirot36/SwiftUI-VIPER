//
//  PokemonFavListConfigurator.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import SwiftUI
import SwiftData

struct PokemonFavListConfigurator {
    
    private let navigationController: NavigationController
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    @MainActor func viewController() -> UIViewController {
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
        let router = PokemonFavListRouterDefault(navigationController: navigationController)
        
        // ModelContext
        let modelContext = sharedModelContainer.mainContext
        
        // Interactor
        let getPokemonFavListInteractor = GetFavPokemonListInteractorDefault(modelContext: modelContext)
        
        // Presenter
        let presenter = PokemonFavListPresenterDefault(
            getPokemonFavListInteractor: getPokemonFavListInteractor,
            router: router
        )
        
        // View
        let view: some View = PokemonFavListView<PokemonFavListPresenterDefault>().environmentObject(presenter)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}


