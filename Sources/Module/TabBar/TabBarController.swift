//
//  TabBarController.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 17.04.2024.
//

import UIKit

final class TabBarController: UITabBarController {
//    private let episodesVC = EpisodesViewController()
//    private let favouritesVC = FavouritesVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
   private func setupTabs() {
//       let house = createNavBar(with: UIImage(systemName: "house"), and: UIImage(systemName: "house.fill"), vc: episodesVC)
//       let heart = createNavBar(with: UIImage(systemName: "heart"), and: UIImage(systemName: "heart.fill"), vc: favouritesVC)
       self.tabBar.layer.masksToBounds = false
       self.tabBar.layer.shadowRadius = 20
       self.tabBar.layer.shadowOpacity = 120
       self.tabBar.layer.shadowColor = UIColor.black.cgColor
       self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 20)
       self.tabBar.itemPositioning = .centered
       self.tabBar.itemSpacing = CGFloat(20)
       self.tabBar.backgroundColor = .white
       self.tabBar.unselectedItemTintColor = UIColor(named: "TabBarItemsFrame")
       self.tabBar.tintColor = UIColor(named: "TappedItem")
//       self.setViewControllers([house, heart], animated: true)
    }
    
    private func createNavBar(with image: UIImage?, and activatedImage: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        nav.tabBarItem.selectedImage = activatedImage
        return nav
    }
}

#Preview {
    let tabBar = TabBarController()
    return tabBar
}
