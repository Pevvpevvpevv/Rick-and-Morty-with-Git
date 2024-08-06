
import UIKit

final class LaunchScreenViewController: UIViewController {
    enum Event {
        case launchComplete
    }
    
    //MARK: - Property
    var didSendEventHandler: ((LaunchScreenViewController.Event) -> Void)?
    private lazy var animator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
    }()
    
    private lazy var launchTitleImageView = makeLaunchTitleImageView()
    private lazy var launchPortalImageView = makeLaunchPortalImageView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureUI()
        showLaunchToMainFlowAnimation()
    }
    
    //MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(launchTitleImageView)
        view.addSubview(launchPortalImageView)
    }
    
    private func configureUI() {
        launchTitleImageView.translatesAutoresizingMaskIntoConstraints = false
        launchPortalImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            launchTitleImageView.heightAnchor.constraint(equalToConstant: 104),
            launchTitleImageView.widthAnchor.constraint(equalToConstant: 312),
            launchTitleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            launchTitleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            launchPortalImageView.heightAnchor.constraint(equalToConstant: 200),
            launchPortalImageView.widthAnchor.constraint(equalToConstant: 200),
            launchPortalImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 347),
            launchPortalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func showLaunchToMainFlowAnimation() {
        animator.addAnimations {
            self.launchTitleImageView.alpha = 0
            self.launchPortalImageView.alpha = 0
        }
        animator.addCompletion { _ in
            self.didSendEventHandler?(.launchComplete)
        }
        animator.startAnimation(afterDelay: 3.0)
    }
}
//MARK: - Private extension
extension LaunchScreenViewController {
    private func makeLaunchTitleImageView() -> UIImageView {
        let title = UIImageView()
        title.contentMode = .scaleToFill
        title.image = UIImage(named: "R&MLogo")
        title.backgroundColor = view.backgroundColor
        return title
    }
    
    private func makeLaunchPortalImageView() -> UIImageView {
        let portal = UIImageView()
        portal.contentMode = .scaleAspectFill
        portal.image = UIImage(named: "Portal")
        portal.backgroundColor = view.backgroundColor
        portal.rotate()
        portal.bounce(object: portal)
        return portal
    }
}
