//
//  UIButtonExtension.swift
//  Travel
//
//  Created by Julius Camba Abarra on 10/19/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit

extension UIButton {
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.95
        pulse.toValue = 1.5
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        self.layer.add(pulse, forKey: "pulse")
    }
    
}
