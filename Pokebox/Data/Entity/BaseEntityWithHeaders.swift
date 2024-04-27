//
//  BaseEntityWithHeaders.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

struct BaseEntityWithHeaders<D: Codable, H: Codable>: BaseEntity {
    var data: D?
    var headers: H?
}
