//
//  NavigationController.swift
//  Pokebox
//
//  Created by Daniel Castro muñoz on 23/4/24.
//

import UIKit

final class NavigationController: UINavigationController {
    override var isNavigationBarHidden: Bool {
        get { true }
        set { super.isNavigationBarHidden = newValue }
    }
}
