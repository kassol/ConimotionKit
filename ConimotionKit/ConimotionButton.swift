//
//  ConimotionButton.swift
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/25/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

import UIKit

@IBDesignable public class ConimotionButton: UIButton, OniMotoble, Corner, Border {

    @IBInspectable public var autoRun: Bool = true
    @IBInspectable public var animationType: String?
    @IBInspectable public var duration: Double = Double.NaN
    @IBInspectable public var delay: Double = Double.NaN
    @IBInspectable public var force: CGFloat = CGFloat.NaN
    @IBInspectable public var damping: CGFloat = CGFloat.NaN
    @IBInspectable public var velocity: CGFloat = CGFloat.NaN
    @IBInspectable public var repeatCount: Float = Float.NaN
    @IBInspectable public var x: CGFloat = CGFloat.NaN
    @IBInspectable public var y: CGFloat = CGFloat.NaN
    
    public func animate() {
        onimote()
    }
    
    public func animate(completion: OnimotobleCompletion) {
        onimote(completion)
    }
    
    
    // MARK: - Lifecycle
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configInspectableProperties()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configInspectableProperties()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        autoRunAnimation()
    }
    
    // MARK: - Private
    private func configInspectableProperties() {
        configAnimatableProperties()
    }
    
    
    @IBInspectable public var cornerRadius: CGFloat = CGFloat.NaN {
        didSet {
            configCornerRadius()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = CGFloat.NaN {
        didSet {
            configBorder()
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        didSet {
            configBorder()
        }
    }
    
    @IBInspectable public var borderSide: String? {
        didSet {
            configBorder()
        }
    }
}
