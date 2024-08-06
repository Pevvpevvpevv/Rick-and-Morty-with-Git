
import UIKit

final class FavouritesAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getFavouritesView()
    }
}
