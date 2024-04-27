//
//  PokemonFavListView.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 25/4/24.
//

import SwiftUI

struct PokemonFavListView<Presenter: PokemonFavListPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            switch presenter.screenState {
            case .loading:
                loading
            case .empty:
                emptyList
            case .content:
                EmptyView()
                PokemonFavListContentView<Presenter>()
            }
        }
        .toolbar(.backButton, title: "") { _ in
            presenter.goBack()
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
            Text("There are not Favorite Pokemons on the list")
                .font(Theme.Font.bold15)
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

struct PokemonFavListView_Previews: PreviewProvider {
    static var previews: some View {
        let favorites = FavoritePokemon.mockList()
        let presenter: PokemonFavListPresenterMock = PokemonFavListPresenterMock(favPokemonList: favorites)
        DevicesPreview {
            ZStack {
                PokemonListView<PokemonListPresenterMock>()
                    .environmentObject(presenter)
            }
        }
    }
}


