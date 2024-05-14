//
//  MockCharacterViewModel.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 12.05.2024.
//

import UIKit

final class MockCharacterViewModel {
    var mockCharacterContent: [MockCharacterModel]
    init() {
        self.mockCharacterContent = {
            var characterModel: [MockCharacterModel] = [
                MockCharacterModel(
                    cellTitle: "Gender",
                    cellContent: "Male"
                ), MockCharacterModel(
                    cellTitle: "Status",
                    cellContent: "Alive"
                ), MockCharacterModel(
                    cellTitle: "Specie",
                    cellContent: "Human"
                ), MockCharacterModel(
                    cellTitle: "Origin",
                    cellContent: "Earth (C-137)"
                ), MockCharacterModel(
                    cellTitle: "Type",
                    cellContent: "Unknown"
                ), MockCharacterModel(
                    cellTitle: "Location",
                    cellContent: "Earth (Replacement Dimension)"
                )
            ]
            return characterModel
        }()
    }
}
