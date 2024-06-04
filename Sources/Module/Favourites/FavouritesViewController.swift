//
//  FavouritesVC.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 20.03.2024.
//

import UIKit

final class FavouritesViewController: UIViewController {
    weak var characterViewControllerDelegate: CharacterViewControllerDelegate?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .white
        
    }
    
    private func configureUI() {
        
    }
}

#Preview {
    let vc = FavouritesViewController()
    return vc
}
