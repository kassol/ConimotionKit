//
//  File.swift
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/25/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

import UIKit

public extension CALayer {
    class func animate(animation: OnimotobleExecution, completion: OnimotobleCompletion? = nil) {
        CATransaction.begin()
        if let completion = completion {
            CATransaction.setCompletionBlock { completion() }
        }
        animation()
        CATransaction.commit()
    }
}