//
//  PokemonDetailView.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import SwiftUI

struct PokemonDetailsView<Presenter: PokemonDetailPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            switch presenter.screenState {
            case .loading:
                loading
            case .error:
                PokemonDetailsErrorView<Presenter>()
            case .empty:
                emptyContent
            case .content:
                PokemonDetailsContentView<Presenter>()
            }
        }
        .onAppear { presenter.loadPokemonDetail() }
        .toolbar(.backButton, title: "") { _ in
            presenter.goBack()
        }
    }
    
    var loading: some View {
        VStack {
            Text("Loading")
                .font(Theme.Font.bold25)
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
    
    var emptyContent: some View {
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

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter: MockPokemonDetailPresenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        DevicesPreview {
            PokemonDetailsView<MockPokemonDetailPresenter>()
                .environmentObject(presenter)
        }
    }
}

