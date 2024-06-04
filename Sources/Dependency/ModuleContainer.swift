//
//  ModuleContainer.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 13.04.2024.
//

import UIKit

protocol ModuleContainerProtocol {
    func getLaunchView() -> UIViewController
    func getEpisodesView(delegate: CharacterViewControllerDelegate) -> UIViewController
    func getCharacterView() -> UIViewController
    func getFavouritesView() -> UIViewController
    func getTabBarController(_ coordinator: TabBarCoordinatorProtocol?, delegate: CharacterViewControllerDelegate) -> UITabBarController
}

final class ModuleContainer: ModuleContainerProtocol {
    private let dependencies: DependenciesProtocol
    required init(_ dependencies: DependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension ModuleContainer {
    func getLaunchView() -> UIViewController {
        return LaunchScreenViewController()
    }
}

extension ModuleContainer {
    func getEpisodesView(delegate: CharacterViewControllerDelegate) -> UIViewController {
        let view = EpisodesViewController()
        view.characterViewControllerDelegate = delegate
        let navController = UINavigationController(rootViewController: view)
        return navController
    }
}

extension ModuleContainer {
    func getCharacterView() -> UIViewController {
        let view = CharacterViewController()
        //        let viewModel = CharacterViewModel(dependencies)
        //        view.viewModel = viewModel
        return view
    }
}

extension ModuleContainer {
    func getFavouritesView() -> UIViewController {
        let view = FavouritesViewController()
        //        let viewModel = FavouritesViewModel(dependencies)
        //        view.viewModel = viewModel
        return view
    }
}

extension ModuleContainer {
    func getTabBarController(_ coordinator: TabBarCoordinatorProtocol?, delegate: CharacterViewControllerDelegate) -> UITabBarController {
        let tabBar = TabBarController()
        let episodesVC = EpisodesAssembly.configure(dependencies, delegate: delegate)
        let favouritesVC = FavouritesAssembly.configure(dependencies)
        
        tabBar.viewControllers = [episodesVC, favouritesVC]

        return tabBar
    }
}
