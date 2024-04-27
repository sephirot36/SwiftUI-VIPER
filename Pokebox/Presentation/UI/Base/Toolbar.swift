//
//  Toolbar.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 24/4/24.
//

import SwiftUI

private typealias builder = ToolbarItemsBuilder

struct NavigationBackToolbar: ViewModifier {
    
    let title: String
    let action: ((_ action: ToolbarAction) -> Void)?
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        builder.iconButton(
                            buttonImage: Image(systemName: "chevron.left"),
                            buttonAction: .goBack,
                            action: action,
                            paddingEdge: .all
                        )
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigationFavoritesToolbar: ViewModifier {
    
    let title: String
    let action: ((_ action: ToolbarAction) -> Void)?
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        builder.iconButton(
                            buttonImage: Image(systemName: "star.circle.fill"),
                            buttonAction: .goFavorites,
                            action: action,
                            paddingEdge: .all
                        )
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


extension View {
        
    @ViewBuilder
    func toolbar(
        _ style: ToolbarStyle.Navigation,
        title: String = "",
        action: ((_ action: ToolbarAction) -> Void)?
    ) -> some View {
        switch style {
        case .backButton:
            modifier(NavigationBackToolbar(title: title, action: action))
        case .favoritesButton:
            modifier(NavigationFavoritesToolbar(title: title, action: action))
        }
    }
}

enum ToolbarItemsBuilder {
    
    static func iconButton(
        buttonImage: Image,
        buttonAction: ToolbarAction,
        action: ((_ action: ToolbarAction) -> Void)?,
        paddingEdge: Edge.Set,
        isOverDark: Bool = false
    ) -> some View {
        Button {
            action?(buttonAction)
        } label: {
            buttonImage
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.black)
        }
    }
}

enum ToolbarStyle {

    enum Navigation {
        
        case backButton
        case favoritesButton
    }
}

enum ToolbarAction {
    
    case goBack
    case goFavorites
}

