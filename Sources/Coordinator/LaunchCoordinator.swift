//
//  LaunchCoordinator.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 13.04.2024.
//

import UIKit

protocol LaunchCoordinatorProtocol: Coordinator {
    func start()
}

final class LaunchCoordinator: LaunchCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: DependenciesProtocol
    required init(_ navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchScreenVC()
    }
    
    func showLaunchScreenVC() {
        let launchVC = LaunchAssembly.configure(dependencies)
        if let launchVC = launchVC as? LaunchScreenViewController {
            launchVC.didSendEventHandler = { [weak self] event in
                switch event {
                case .launchComplete:
                    self?.finish()
                }
            }
        }
        navigationController.show(launchVC, sender: self)
    }
}
