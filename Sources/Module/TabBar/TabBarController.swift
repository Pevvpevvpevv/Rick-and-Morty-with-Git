
import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }
    
   private func setupTabs() {
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
    }
}

#Preview {
    let tabBar = TabBarController()
    return tabBar
}
