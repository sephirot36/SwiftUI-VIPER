//
//  StringProtocol+Ext.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 22/4/24.
//

import Foundation

extension StringProtocol {
    
    var firstUppercased: String {
        prefix(1).uppercased() + dropFirst()
    }
}
