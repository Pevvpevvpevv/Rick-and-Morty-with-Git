
import UIKit

protocol ModuleContainerProtocol {
    func getLaunchView() -> UIViewController
    func getEpisodesView(delegate: CharacterViewControllerDelegate) -> UINavigationController
    func getCharacterView() -> UIViewController
    func getFavouritesView() -> UINavigationController
    func getTabBarController(_ coordinator: TabBarCoordinatorProtocol?, delegate: CharacterViewControllerDelegate) -> UITabBarController
}

final class ModuleContainer: ModuleContainerProtocol {
    private let dependencies: DependenciesProtocol
    private let networkService: NetworkServiceProtocol
    
    required init(_ dependencies: DependenciesProtocol) {
        self.dependencies = dependencies
        self.networkService = dependencies.networkService
    }
}

extension ModuleContainer {
    func getLaunchView() -> UIViewController {
        return LaunchScreenViewController()
    }
}

extension ModuleContainer {
    func getEpisodesView(delegate: CharacterViewControllerDelegate) -> UINavigationController {
        let view = EpisodesViewController()
        view.characterViewControllerDelegate = delegate
        let viewModel = EpisodesViewModel(dependencies)
        view.viewModel = viewModel
        let navController = UINavigationController(rootViewController: view)
        return navController
    }
}

extension ModuleContainer {
    func getCharacterView() -> UIViewController {
        let view = CharacterViewController()
        return view
    }
}

extension ModuleContainer {
    func getFavouritesView() -> UINavigationController {
        let view = FavouritesViewController()
        let navController = UINavigationController(rootViewController: view)
        return navController
    }
}

extension ModuleContainer {
    func getTabBarController(_ coordinator: TabBarCoordinatorProtocol?, delegate: CharacterViewControllerDelegate) -> UITabBarController {
        let tabBar = TabBarController()
        let episodesVC = EpisodesAssembly.configure(dependencies, delegate: delegate)
        let favouritesVC = FavouritesAssembly.configure(dependencies)
        tabBar.viewControllers = [episodesVC, favouritesVC]
        episodesVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        favouritesVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        return tabBar
    }
}
