//
//  UIImageView+extension.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 26.03.2024.
//

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
            //        }, completion: { done in
            //            if done {
            //                UIImageView.animate(withDuration: 1, animations: {
            //                    object.transform = CGAffineTransform(scaleX: 1, y: 1)
            //                })
            //            }
        })
    }
}
