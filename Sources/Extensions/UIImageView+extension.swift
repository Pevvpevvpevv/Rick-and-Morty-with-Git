
import UIKit

extension UIImageView {
    //MARK: - Rotating animation
    func rotate() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 2
        rotation.repeatCount = .infinity
        rotation.isCumulative = true
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    //MARK: - Bouncing animation
    func bounce(object: UIImageView) {
        UIImageView.animate(withDuration: 3.2, animations: {
            object.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        })
    }
}
