//
//  PokemonDetailsErrorView.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import SwiftUI

struct PokemonDetailsErrorView<Presenter: PokemonDetailPresenter>: View {
    
    private let buttonWidth: CGFloat = 200
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        VStack(spacing: Theme.Spacing.space_2) {
            explanation
            button
        }
    }
    
    var explanation: some View {
        Text("There was a problem.")
            .font(Theme.Font.normal14)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding(.horizontal, Theme.Spacing.space_10)
            .padding(.bottom, Theme.Spacing.space_1)
    }
    
    var button: some View {
        Button("Retry") {
            presenter.loadPokemonDetail()
        }
        .frame(width: buttonWidth)
    }
}

struct PokemonDetailsErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter: PokemonListPresenterMock = PokemonListPresenterMock(pokemonList: [])
        DevicesPreview {
            ZStack {
                PokemonListErrorView<PokemonListPresenterMock>()
                    .environmentObject(presenter)
            }
        }
    }
}

