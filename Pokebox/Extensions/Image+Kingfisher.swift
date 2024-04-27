//
//  Image+Kingfisher.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import SwiftUI
import Kingfisher

extension Image {
    static func cachedURL(_ url: URL?) -> KFImage {
        KFImage.url(url, cacheKey: url?.cacheKey)
    }
}

