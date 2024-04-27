//
//  Theme.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import SwiftUI

enum Theme { 
    // Fonts
    enum Font {
        static var normal12: SwiftUI.Font = .system(size: 12, weight: .regular)
        static var normal14: SwiftUI.Font = .system(size: 14, weight: .regular)
        static var normal20: SwiftUI.Font = .system(size: 20, weight: .regular)
        static var bold12: SwiftUI.Font = .system(size: 12, weight: .bold)
        static var bold15: SwiftUI.Font = .system(size: 15, weight: .bold)
        static var bold25: SwiftUI.Font = .system(size: 25, weight: .bold)
        static var bold35: SwiftUI.Font = .system(size: 35, weight: .bold)
        static var bold85: SwiftUI.Font = .system(size: 85, weight: .bold)
    }
    
    // Button
    enum Button {
        static var normalHeight: CGFloat = 48
        static var smallHeight: CGFloat = 40
        static var radius: CGFloat = 8
        static var chipRadius: CGFloat = 64
        static var foregroundOpacity: CGFloat = 0.38
        static var firstShadowOpacity: CGFloat = 0.15
        static var secondShadowOpacity: CGFloat = 0.3
        static var firstShadowRadius: CGFloat = 3
        static var secondShadowRadius: CGFloat = 2
        static var loadingOpacity: CGFloat = 0.5
    }
    
    // Spacing
    enum Spacing {
        /// 2
        static var space_0_25: CGFloat = 2
        /// 4
        static var space_0_5: CGFloat = 4
        /// 8
        static var space_1: CGFloat = 8
        /// 12
        static var space_1_5: CGFloat = 12
        /// 16
        static var space_2: CGFloat = 16
        /// 24
        static var space_3: CGFloat = 24
        /// 32
        static var space_4: CGFloat = 32
        /// 40
        static var space_5: CGFloat = 40
        /// 48
        static var space_6: CGFloat = 48
        /// 64
        static var space_8: CGFloat = 64
        /// 80
        static var space_10: CGFloat = 80
        /// 160
        static var space_20: CGFloat = 160
    }
    
    // Radius
    enum Radius {
        /// 4
        static var extraSmall: CGFloat = 4
        /// 8
        static var small: CGFloat = 8
        /// 16
        static var medium: CGFloat = 16
        /// 24
        static var large: CGFloat = 24
        /// 32
        static var extraLarge: CGFloat = 32
    }
    
    // Toolbar
    enum Toolbar {
        static var iconPadding: CGFloat = 10
        static var iconSize: CGFloat = 24
        static var logoWidth: CGFloat = 47
        static var logoHeigh: CGFloat = 40
        static var buttonItemSize: CGFloat = 24
        static var buttonItemPadding: CGFloat = 12
        static var imageIconSize: CGFloat = 32
        static var menuButtonSize: CGFloat = 44
        static var paddingCorrector: CGFloat = 8
    }
}
