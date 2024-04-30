//
//  ModuleContainer.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 13.04.2024.
//

import UIKit

protocol ModuleContainerProtocol {
    func getLaunchView() -> UIViewController
    func getEpisodesView() -> UIViewController
    func getCharacterView() -> UIViewController
    func getFavouritesView() -> UIViewController
    func getTabBarController() -> UITabBarController
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
    func getEpisodesView() -> UIViewController {
        let view = EpisodesVC()
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
    func getTabBarController() -> UITabBarController {
        let tabBar = TabBarController()
        return tabBar
    }
}
