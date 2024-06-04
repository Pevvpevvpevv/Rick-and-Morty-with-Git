//
//  Dependencies.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 13.04.2024.
//

import Foundation

protocol DependenciesProtocol {
    var moduleContainer: ModuleContainerProtocol { get }
    var networkService: NetworkService { get }
}

final class Dependencies: DependenciesProtocol {
    lazy var moduleContainer: ModuleContainerProtocol = ModuleContainer(self)
    lazy var networkService: NetworkService = NetworkService()
}
