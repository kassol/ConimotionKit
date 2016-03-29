//
//  Shadow.swift
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/29/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

import UIKit

public protocol Shadow {
    
    var shadowColor: UIColor? { get set }
    
    var shadowRadius: CGFloat { get set }
    
    var shadowOpacity: CGFloat { get set }
    
    var shadowOffset: CGPoint { get set }
    
}

public extension Shadow where Self: UIView {
    func commonConfig() {
        if layer.masksToBounds {
            layer.masksToBounds = false
        }
    }
    
    func configShadowColor() {
        if let color = shadowColor {
            commonConfig()
            layer.shadowColor = color.CGColor
        }
        
    }
    
    func configShadowRadius() {
        if !shadowRadius.isNaN && shadowRadius > 0 {
            commonConfig()
            layer.shadowRadius = shadowRadius
        }
    }
    
    func configShadowOpacity() {
        if !shadowOpacity.isNaN {
            commonConfig()
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    func configShadowOffset() {
        if !shadowOffset.x.isNaN {
            commonConfig()
            layer.shadowOffset.width = shadowOffset.x
        }
        if !shadowOffset.y.isNaN {
            commonConfig()
            layer.shadowOffset.height = shadowOffset.y
        }
    }
}
