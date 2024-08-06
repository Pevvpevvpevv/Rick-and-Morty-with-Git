
import UIKit

final class CharacterAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getCharacterView()
    }
}
