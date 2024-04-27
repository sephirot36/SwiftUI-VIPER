//
//  PokemonListItem.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import SwiftUI

struct PokemonListItem: View {
    
    private let avatarSize: CGFloat = 90
    private let rowSizeHeight: CGFloat = 64
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 100
    private let backgroundImageXOffset: CGFloat = 20
    private let backgroundImageYOffset: CGFloat = 0
    private let backgroundImageOpacity: CGFloat = 0.53
    
    let space_16: CGFloat = 16
    
    let viewModel: PokemonListItemViewModel
    let onTap: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        ZStack {
            background
            content
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            onTap()
        }
        .onLongPressGesture {
            onDelete()
        }
    }
    
    var background: some View {
        Rectangle()
            .foregroundColor(.gray)
            .overlay {
                backgroundImage
                    .foregroundColor(.white)
            }
            .frame(height: rowSizeHeight)
            .cornerRadius(32)
    }
    
    var backgroundImage: some View {
        HStack {
            Spacer()
            Image("pokeball")
                .resizable()
                .frame(width: backgroundImageSize, height: backgroundImageSize)
                .offset(x: backgroundImageXOffset, y: backgroundImageYOffset)
                .opacity(backgroundImageOpacity)
        }
    }
    
    var content: some View {
        HStack(spacing: space_16) {
            number
            name
            Spacer()
            picture
            Spacer()
        }
        .frame(height: rowSizeHeight)
        .padding(.horizontal, space_16)
    }
    
    var number: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .fill(.red)
                .padding(.vertical, Theme.Spacing.space_1_5)
                .opacity(0.85)
            Circle()
                .trim(from: 0, to: 0.5)
                .fill(.white)
                .padding(.vertical, Theme.Spacing.space_1_5)
                .opacity(0.785)
            Image("pokeball")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.black)
            .opacity(0.5)
            .frame(width: 55, height: 55)
            .clipShape(Circle())
            .shadow(radius: 0)
            Text(viewModel.number)
                .font(Theme.Font.bold15)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1)
            
        }
    }
    
    var picture: some View {
        Image.cachedURL(URL(string: viewModel.imageURL))
            .placeholder {
                Image("pokeball")
                    .resizable()
                    .opacity(imagePlaceholderOpacity)
                    .frame(width: avatarSize, height: avatarSize)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: avatarSize, height: avatarSize)
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.bold12)
            .foregroundColor(.white)
    }
    
    var favorite: some View {
        Image(systemName: viewModel.favorite ? "star.fill" : "star")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
    }
}

struct PokemonListItem_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                PokemonListItem(
                    viewModel: .init(
                        number: "4",
                        name: "Charmander",
                        imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
                        favorite: false
                    ),
                    onTap: {}, 
                    onDelete: {}
                )
            }
        }
    }
}

