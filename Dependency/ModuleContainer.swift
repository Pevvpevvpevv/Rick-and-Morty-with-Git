//
//  ModuleContainer.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 13.04.2024.
//

import UIKit

protocol ModuleContainerProtocol {
    func getLaunchView() -> UIViewController
    func getEpisodesView(coordinator: EpisodesCoordinatorProtocol) -> UIViewController
    func getCharacterView() -> UIViewController
    func getFavouritesView() -> UIViewController
    func getTabBarController(coordinator: TabBarCoordinatorProtocol) -> UITabBarController
}

final class ModuleContainer: ModuleContainerProtocol {
    private let dependencies: DependenciesProtocol
    required init(_ dependencies: DependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension ModuleContainer {
    func getLaunchView() -> UIViewController {
        return LaunchScreenVC()
    }
}

extension ModuleContainer {
    func getEpisodesView(coordinator: EpisodesCoordinatorProtocol) -> UIViewController {
        let view = EpisodesVC()
        view.setupCoordinator(coordinator: coordinator)
        return view
    }
}

extension ModuleContainer {
    func getCharacterView() -> UIViewController {
        let view = CharacterVC()
        //        let viewModel = CharacterViewModel(dependencies)
        //        view.viewModel = viewModel
        return view
    }
}

extension ModuleContainer {
    func getFavouritesView() -> UIViewController {
        let view = FavouritesVC()
        //        let viewModel = FavouritesViewModel(dependencies)
        //        view.viewModel = viewModel
        return view
    }
}

extension ModuleContainer {
    func getTabBarController(coordinator: TabBarCoordinatorProtocol) -> UITabBarController {
        let tabBar = TabBarController()
        tabBar.setupCoordinator(coordinator: coordinator)
        return tabBar
    }
}
