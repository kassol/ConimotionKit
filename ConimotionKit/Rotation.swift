//
//  Rotation.swift
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/29/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

import UIKit

public protocol Rotation {
    var rotate: CGFloat { get set }
}

public extension Rotation where Self: UIView {
    func configRotation() {
        if !rotate.isNaN {
            self.transform = CGAffineTransformMakeRotation((CGFloat)(M_PI)*rotate/180)
        }
    }
}
