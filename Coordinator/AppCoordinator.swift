//
//  AppCoordinator.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 11.04.2024.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    //    private let userDefaultsRepository: UserDefaultsRepositoryProtocol
    var dependencies: DependenciesProtocol
    
    required init(_ navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
        self.dependencies = dependencies
        //        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    func start() {
        showLaunchFlow()
    }
    
    func showLaunchFlow() {
        let launchCoordinator = LaunchCoordinator(navigationController, dependencies: dependencies)
        launchCoordinator.finishDelegate = self
        launchCoordinator.start()
        childCoordinators.append(launchCoordinator)
    }
    
    func showMainFlow() {
        let tabBar = TabBarCoordinator(navigationController: navigationController, dependencies: dependencies)
        tabBar.finishDelegate = self
        tabBar.start()
        childCoordinators.append(tabBar)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .launch:
            showMainFlow()
        case .app, .episodes, .favourites, .character, .tabBar: break
        }
    }
}
