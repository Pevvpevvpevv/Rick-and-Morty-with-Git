//
//  EpisodesCoordinator.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 13.04.2024.
//

import UIKit

protocol EpisodesCoordinatorProtocol: Coordinator {
    func start()
}

final class EpisodesCoordinator: EpisodesCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .episodes }
    var dependencies: DependenciesProtocol
    required init(_ navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showEpisodesVC()
    }
    
    func showEpisodesVC() {
        let episodesVC = EpisodesAssembly.configure(dependencies)
    }
}
