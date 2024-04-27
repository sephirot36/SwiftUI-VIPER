//
//  PokemonListContentView.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import SwiftUI

struct PokemonListContentView<Presenter: PokemonListPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.space_3) {
                ForEach(presenter.pokemonList.pokemon, id: \.number) { pokemonListItemViewModel in
                    PokemonListItem(
                        viewModel: pokemonListItemViewModel,
                        onTap: {
                            presenter.loadPokemonDetail(id: pokemonListItemViewModel.number)
                        }, onDelete: {}
                    )
                }
            }
            .padding(.all, Theme.Spacing.space_2)
        }
    }
}

struct PokemonListContentView_Previews: PreviewProvider {
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

