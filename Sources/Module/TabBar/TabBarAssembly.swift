
import UIKit

final class TabBarAssembly {
    static func configure(_ dependencies: DependenciesProtocol, coordinator: TabBarCoordinatorProtocol?, delegate: CharacterViewControllerDelegate) -> UITabBarController {
        return dependencies.moduleContainer.getTabBarController(coordinator, delegate: delegate)
    }
}
