//
//  PokeboxAPI.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

extension API.Backend {
    
    
    enum PokeboxAPI: URLRequestConvertible {
        
        case list(request: GetPokemonListRequest)
        case detail(id: String)
        
        var method: HttpConstants.Method {
            switch self {
            case .list, .detail:
                return .get
            }
        }
        
        var endpoint: URL? {
            switch self {
            case .list(let request):
                return URL(string: HttpConstants.apiBaseURL + "v2/pokemon?limit=\(request.limit)&offset=\(request.offset)")
            case .detail(let id):
                return URL(string: HttpConstants.apiBaseURL + "v2/pokemon/\(id)/")
            }
        }
        
        func addHeaders(toRequest request: inout URLRequest) { }
        
        func addBody(toRequest request: inout URLRequest) { }
    }
}

