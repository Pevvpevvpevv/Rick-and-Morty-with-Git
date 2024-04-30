//
//  Coordinator.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 11.04.2024.
//

import UIKit

enum CoordinatorType {
    case app, launch, episodes, favourites, character, tabBar
}

protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    var dependencies: DependenciesProtocol { get }
    func start()
    func finish()
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
