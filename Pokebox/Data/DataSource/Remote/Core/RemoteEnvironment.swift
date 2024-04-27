//
//  RemoteEnvironment.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

enum RemoteEnvironment: String {
    case pro
    case dev
    case pre
    
    var url: String {
        switch self {
        case .pro:
            return "https://pokeapi.co/"
        case .dev:
            return "https://pokeapi.co/"
        case .pre:
            return "https://pokeapi.co/"
        }
    }
}
