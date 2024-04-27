//
//  PokemonDetailView.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    private let pokemonImageSize: CGFloat = 250
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 300
    private let backgroundImageOpacity: CGFloat = 0.3
    private let dataContainerHeight: CGFloat = 0.4
    private let backgroundOpacity: CGFloat = 0.5
    
    let viewModel: PokemonDetailViewViewModel
    
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .top) {
                backgroundImage
                VStack(alignment: .center, spacing: 0) {
                    pokemonImage
                    name
                    number
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .ignoresSafeArea()
                        .padding(.top, Theme.Spacing.space_8)
                        stats
                    }
                    .frame(height: metrics.size.height * dataContainerHeight)
                }
                
            }
            .background(.gray.opacity(backgroundOpacity))
        }
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.bold35)
            .foregroundColor(.black)
    }
    
    var number: some View {
        Text(viewModel.formatedNumber)
            .font(Theme.Font.bold85)
            .foregroundColor(.black)
    }
    
    var backgroundImage: some View {
        Image("pokeball")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.white)
            .frame(width: backgroundImageSize, height: backgroundImageSize)
            .opacity(backgroundImageOpacity)
    }
    
    var stats: some View {
        HStack(alignment: .center) {
            Spacer()
            VStack {
                Text(String(viewModel.height))
                    .font(Theme.Font.bold25)
                    .foregroundColor(.black)
                Text("Height")
                    .font(Theme.Font.normal20)
                    .foregroundColor(.black)
            }
            Spacer()
            VStack {
                Text(String(viewModel.weight))
                    .font(Theme.Font.bold25)
                    .foregroundColor(.black)
                Text("Weight")
                    .font(Theme.Font.normal20)
                    .foregroundColor(.black)
            }
            Spacer()
        }
    }
    
    var pokemonImage: some View {
        Image.cachedURL(URL(string: viewModel.imageURL))
            .placeholder {
                Image("pokeball")
                    .resizable()
                    .opacity(imagePlaceholderOpacity)
                    .frame(width: pokemonImageSize, height: pokemonImageSize)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: pokemonImageSize, height: pokemonImageSize)
    }
}

struct PokemonDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                PokemonDetailView(
                    viewModel: .init(
                        number: 4,
                        name: "Charmander",
                        imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
                        height: 6,
                        weight: 85
                    )
                )
            }
        }
    }
}
