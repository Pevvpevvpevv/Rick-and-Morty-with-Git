
import UIKit

final class LaunchAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getLaunchView()
    }
}
