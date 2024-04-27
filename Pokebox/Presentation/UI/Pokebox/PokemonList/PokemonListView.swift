//
//  PokemonListView.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import SwiftUI

struct PokemonListView<Presenter: PokemonListPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            switch presenter.screenState {
            case .loading:
                loading
            case .error:
                PokemonListErrorView<Presenter>()
            case .empty:
                emptyList
            case .content:
                PokemonListContentView<Presenter>()
            }
        }
        .toolbar(.favoritesButton, title: "") { _ in
            presenter.goToFavorites()
        }
    }
    
    var loading: some View {
        VStack {
            Text("Loading")
                .font(Theme.Font.bold85)
                .foregroundColor(.black)
            
            Image("pokeball")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.black)
            .opacity(0.5)
            .frame(width: 55, height: 55)
            .clipShape(Circle())
            .shadow(radius: 0)
        }
    }
    
    var emptyList: some View {
        VStack {
            Text("There are not Pokemons on the list")
                .font(Theme.Font.bold85)
                .foregroundColor(.black)
            
            Image("pokeball")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.black)
            .opacity(0.5)
            .frame(width: 55, height: 55)
            .clipShape(Circle())
            .shadow(radius: 0)
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = Pokemon.mockList()
        let presenter: PokemonListPresenterMock = PokemonListPresenterMock(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                PokemonListView<PokemonListPresenterMock>()
                    .environmentObject(presenter)
            }
        }
    }
}

