//
//  URLRequest+Headers.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

extension URLRequest {
    
    mutating func addContentHeaders() {
        setValue(HttpConstants.HeaderValue.applicationJson, forHTTPHeaderField: HttpConstants.Header.contentType)
    }
}

extension URLRequest {
    
    mutating func addEncodedBody(withParams params: Encodable) {
        httpBody = try? JSONEncoder().encode(params)
    }
}
