//
//  Corner.swift
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/25/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

import UIKit

public protocol Corner {
    var cornerRadius: CGFloat { set get }
}

public extension Corner where Self: UIView {
    public func configCornerRadius() {
        if !cornerRadius.isNaN && cornerRadius >= 0 {
            layer.cornerRadius = cornerRadius
        }
    }
}
