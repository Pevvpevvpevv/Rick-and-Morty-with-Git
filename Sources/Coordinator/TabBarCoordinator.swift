
import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func start()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tabBar }
    var dependencies: DependenciesProtocol
    
    required init(navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showTabBarController()
    }
    
    private func showTabBarController() {
        let tabBar = TabBarAssembly.configure(dependencies, coordinator: self, delegate: self)
        let episodesVC = EpisodesViewController()
        guard let tabBar = tabBar as? TabBarController,
              let navController = tabBar.viewControllers?[0] as? UINavigationController              
        else { return }
        
        navigationController = navController
        
        if let window = UIApplication.shared.windows.filter({
            $0.isKeyWindow
        }).first {
            window.rootViewController = tabBar
            UIView.transition(
                with: window,
                duration: 1.0,
                options: [.transitionCrossDissolve],
                animations: nil,
                completion: nil
            )
        } else {
            tabBar.modalPresentationStyle = .fullScreen
            navigationController.showDetailViewController(
                tabBar,
                sender: self
            )
        }
    }
}

extension TabBarCoordinator: CharacterViewControllerDelegate {
    func didPushCharacterVC(_ model: CharactersResult) {
        let characterVC = CharacterAssembly.configure(dependencies, model)
        navigationController.pushViewController(characterVC, animated: true)
    }
}
