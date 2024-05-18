//
//  TabBarAssembly.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 17.04.2024.
//

import UIKit

final class TabBarAssembly {
    static func configure(
        _ dependencies: DependenciesProtocol,
        coordinator: TabBarCoordinatorProtocol
    ) -> UITabBarController {
        return dependencies.moduleContainer.getTabBarController(coordinator: coordinator)
    }
}
