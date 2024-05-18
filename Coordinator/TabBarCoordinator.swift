//
//  TabBarCoordinator.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 17.04.2024.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func start()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tabBar }
    var dependencies: DependenciesProtocol
    required init(navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showTabBarController()
    }
    
    func showTabBarController() {
        let tabBar = TabBarAssembly.configure(dependencies, coordinator: self)
//        navigationController.pushViewController(tabBar, animated: false)
//        let navVC = UINavigationController(rootViewController: tabBar)
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            window.rootViewController = tabBar
            UIView.transition(with: window, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        } else {
            tabBar.modalPresentationStyle = .fullScreen
            navigationController.showDetailViewController(tabBar, sender: self)
        }
    }
}
