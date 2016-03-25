//
//  Border.swift
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/25/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

import UIKit

public protocol Border {
    var borderWidth: CGFloat { set get }
    var borderColor: UIColor? { set get }
    var borderSide: String? { get set }
}

public extension Border where Self: UIView {
    public func configBorder() {
        guard let unwrappedBorderColor = borderColor else {
            return
        }
        
        if borderWidth.isNaN || borderWidth <= 0 {
            return
        }
        
        layer.sublayers?.filter  { $0.name == "borderSideLayer" }
            .forEach { $0.removeFromSuperlayer() }
        layer.borderWidth = 0
        if let unwrappedBorderSide = borderSide, side = BorderSide(rawValue: unwrappedBorderSide) {
            configBorderWithSide(side, borderColor: unwrappedBorderColor)
        } else {
            configBorderForAllSides(unwrappedBorderColor)
        }
    }
    
    private func configBorderWithSide(side: BorderSide, borderColor: UIColor) {
        let border = CALayer()
        border.name = "borderSideLayer"
        border.backgroundColor = borderColor.CGColor
        
        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: borderWidth)
        case .Right:
            border.frame = CGRect(x: bounds.size.width - borderWidth, y: 0, width: borderWidth, height: bounds.size.height)
        case .Bottom:
            border.frame = CGRect(x: 0, y: bounds.size.height - borderWidth, width: bounds.size.width, height: borderWidth)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: bounds.size.height)
        }
        layer.addSublayer(border)
    }
    
    private func configBorderForAllSides(borderColor: UIColor) {
        if let mask = layer.mask as? CAShapeLayer {
            let borderLayer = CAShapeLayer()
            borderLayer.path = mask.path
            borderLayer.fillColor = UIColor.clearColor().CGColor
            borderLayer.strokeColor = borderColor.CGColor
            borderLayer.lineWidth = borderWidth
            borderLayer.frame = bounds
            layer.insertSublayer(borderLayer, atIndex: 0)
            layer.borderWidth = 0
        } else {
            layer.borderColor = borderColor.CGColor
            layer.borderWidth = borderWidth
        }
    }
}
