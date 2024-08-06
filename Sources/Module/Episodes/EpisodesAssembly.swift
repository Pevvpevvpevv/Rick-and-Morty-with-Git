
import UIKit

final class EpisodesAssembly {
    static func configure(_ dependencies: DependenciesProtocol, delegate: CharacterViewControllerDelegate) -> UIViewController {
        return dependencies.moduleContainer.getEpisodesView(delegate: delegate)
    }
}

