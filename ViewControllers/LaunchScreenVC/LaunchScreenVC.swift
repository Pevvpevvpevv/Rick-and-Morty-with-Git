//
//  LaunchScreenVC.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 20.03.2024.
//

import UIKit

final class LaunchScreenVC: UIViewController {
    enum Event {
        case launchComplete
    }
    
    //MARK: - Property
    var didSendEventHandler: ((LaunchScreenVC.Event) -> Void)?
    private lazy var animator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
    }()
    
    private lazy var launchTitleIV = makeLaunchTitleIV()
    private lazy var launchPortalIV = makeLaunchPortalIV()
    
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
        view.addSubview(launchTitleIV)
        view.addSubview(launchPortalIV)
    }
    
    private func configureUI() {
        launchTitleIV.translatesAutoresizingMaskIntoConstraints = false
        launchPortalIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            launchTitleIV.heightAnchor.constraint(equalToConstant: 104),
            launchTitleIV.widthAnchor.constraint(equalToConstant: 312),
            launchTitleIV.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            launchTitleIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            launchPortalIV.heightAnchor.constraint(equalToConstant: 200),
            launchPortalIV.widthAnchor.constraint(equalToConstant: 200),
            launchPortalIV.topAnchor.constraint(equalTo: view.topAnchor, constant: 347),
            launchPortalIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func showLaunchToMainFlowAnimation() {
        animator.addAnimations {
            self.launchTitleIV.alpha = 0
            self.launchPortalIV.alpha = 0
        }
        animator.addCompletion { _ in
            self.didSendEventHandler?(.launchComplete)
        }
        animator.startAnimation(afterDelay: 3.0)
    }
}
//MARK: - Private extension
extension LaunchScreenVC {
    private func makeLaunchTitleIV() -> UIImageView {
        let title = UIImageView()
        title.contentMode = .scaleToFill
        title.image = UIImage(named: "R&MLogo")
        title.backgroundColor = view.backgroundColor
        return title
    }
    
    private func makeLaunchPortalIV() -> UIImageView {
        let portal = UIImageView()
        portal.contentMode = .scaleAspectFill
        portal.image = UIImage(named: "Portal")
        portal.backgroundColor = view.backgroundColor
        portal.rotate()
        portal.bounce(object: portal)
        return portal
    }
}
