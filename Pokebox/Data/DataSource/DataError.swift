//
//  DataError.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

enum DataError: Error, Equatable {
    case invalidUrl
    case encoding
    case decoding
    case badRequest
    case unauthorized
    case forbidden
    case server
    case maintenanceMode
    case network
    case notFound
    case conflict
    case tooManyRequests(retryAfterMiliseconds: Int?)
    case unknown
}
