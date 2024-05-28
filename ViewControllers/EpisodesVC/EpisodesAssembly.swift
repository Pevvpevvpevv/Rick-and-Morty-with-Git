//
//  EpisodesAssembly.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 15.04.2024.
//

import UIKit

final class EpisodesAssembly {
    static func configure(_ dependencies: DependenciesProtocol, delegate: CharacterViewControllerDelegate) -> UIViewController {
        return dependencies.moduleContainer.getEpisodesView(delegate: delegate)
    }
}

