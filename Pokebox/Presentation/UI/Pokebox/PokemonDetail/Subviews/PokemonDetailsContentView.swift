//
//  PokemonDetailsContent.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import SwiftUI

struct PokemonDetailsContentView<Presenter: PokemonDetailPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        VStack {
            PokemonDetailView(viewModel: presenter.pokemonDetail.pokemon)
            favoriteButton
        }
    }
    
    var favoriteButton: some View {
        Button {
            addFavorite()
        } label: {
          Text("Add favorite")
            .padding()
            .foregroundColor(.white)
            .background(.gray)
            .cornerRadius(6.0)
        }
        .padding()
    }
    
    
    
    private func addFavorite() {
        presenter.addToFavorites()
    }
}

struct PokemonDetailsContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter: MockPokemonDetailPresenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        DevicesPreview {
            PokemonDetailsContentView<MockPokemonDetailPresenter>()
                .environmentObject(presenter)
        }
    }
}

