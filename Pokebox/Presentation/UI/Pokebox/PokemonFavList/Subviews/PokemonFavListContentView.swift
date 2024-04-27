//
//  PokemonFavListContentView.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import SwiftUI

struct PokemonFavListContentView<Presenter: PokemonFavListPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.space_3) {
                ForEach(presenter.pokemonFavList.pokemon, id: \.number) { pokemonListItemViewModel in
                    PokemonListItem(
                        viewModel: pokemonListItemViewModel,
                        onTap: {},
                        onDelete: {
                            presenter.deleteFavorite(id: pokemonListItemViewModel.number)
                        }
                    )
                }
            }
            .padding(.all, Theme.Spacing.space_2)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        // viewModel.deleteItems(offsets: offsets)
    }
}

struct PokemonFavListContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = [Pokemon.mock()]
        let presenter: PokemonListPresenterMock = PokemonListPresenterMock(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                PokemonListContentView<PokemonListPresenterMock>()
                    .environmentObject(presenter)
            }
        }
    }
}
