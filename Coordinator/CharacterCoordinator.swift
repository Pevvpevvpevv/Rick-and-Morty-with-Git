//
//  CharacterCoordinator.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 17.04.2024.
//

import UIKit

protocol CharacterCoordinatorProtocol: Coordinator {
    func start()
}

final class CharacterCoordinator: CharacterCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .character }
    var dependencies: DependenciesProtocol
    required init(_ navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        
    }
    
    func showCharacterVC() {
        let episodesVC = CharacterAssembly.configure(dependencies)
        let navController = UINavigationController(rootViewController: CharacterVC())
    }
}
