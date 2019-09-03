//
//  UIView+Transition.swift
//  Shimmer
//
//  Created by tskim on 04/09/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTransition(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.type = .fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }

}

