
import UIKit

final class CharacterAssembly {
    static func configure(_ dependencies: DependenciesProtocol, _ model: CharactersResult) -> UIViewController {
        return dependencies.moduleContainer.getCharacterView(model)
    }
}
