//
//  Onimotoble.swift
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/25/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

import UIKit

public typealias OnimotobleCompletion = () -> Void
public typealias OnimotobleExecution = () -> Void

@objc public protocol OniMotoble: class {
    var autoRun: Bool { get set }
    var animationType: String? { get set }
    var duration: Double { get set }
    var delay: Double { get set }
    var force: CGFloat { get set }
    var damping: CGFloat { get set }
    var velocity: CGFloat { get set }
    var repeatCount: Float { get set }
    var x: CGFloat { get set }
    var y: CGFloat { get set }
    
    func animate()
    func animate(completion: OnimotobleCompletion)
}

public extension OniMotoble where Self: UIView {
    
    public func configAnimatableProperties() {
        if duration.isNaN {
            duration = 0.7
        }
        if delay.isNaN {
            delay = 0
        }
        if damping.isNaN {
            damping = 0.7
        }
        if velocity.isNaN {
            velocity = 0.7
        }
        if force.isNaN {
            force = 1
        }
        if repeatCount.isNaN {
            repeatCount = 1
        }
    }
    
    public func onimote(completion: OnimotobleCompletion? = nil) {
        guard let animationTypeString = animationType else {
            return
        }
        switch animationTypeString {
        case OnimotionType.SlideInLeft.name():
            slideInLeft(completion)
        case OnimotionType.SlideInRight.name():
            slideInRight(completion)
        case OnimotionType.SlideInDown.name():
            slideInDown(completion)
        case OnimotionType.SlideInUp.name():
            slideInUp(completion)
        case OnimotionType.SlideOutLeft.name():
            slideOutLeft(completion)
        case OnimotionType.SlideOutRight.name():
            slideOutRight(completion)
        case OnimotionType.SlideOutDown.name():
            slideOutDown(completion)
        case OnimotionType.SlideOutUp.name():
            slideOutUp(completion)
        case OnimotionType.SqueezeInLeft.name():
            squeezeInLeft(completion)
        case OnimotionType.SqueezeInRight.name():
            squeezeInRight(completion)
        case OnimotionType.SqueezeInDown.name():
            squeezeInDown(completion)
        case OnimotionType.SqueezeInUp.name():
            squeezeInUp(completion)
        case OnimotionType.SqueezeOutLeft.name():
            squeezeOutLeft(completion)
        case OnimotionType.SqueezeOutRight.name():
            squeezeOutRight(completion)
        case OnimotionType.SqueezeOutDown.name():
            squeezeOutDown(completion)
        case OnimotionType.SqueezeOutUp.name():
            squeezeOutUp(completion)
        case OnimotionType.FadeIn.name():
            fadeIn(completion)
        case OnimotionType.FadeOut.name():
            fadeOut(completion)
        case OnimotionType.FadeOutIn.name():
            fadeOutIn(completion)
        case OnimotionType.FadeInOut.name():
            fadeInOut(completion)
        case OnimotionType.FadeInLeft.name():
            fadeInLeft(completion)
        case OnimotionType.FadeInRight.name():
            fadeInRight(completion)
        case OnimotionType.FadeInDown.name():
            fadeInDown(completion)
        case OnimotionType.FadeInUp.name():
            fadeInUp(completion)
        case OnimotionType.FadeOutLeft.name():
            fadeOutLeft(completion)
        case OnimotionType.FadeOutRight.name():
            fadeOutRight(completion)
        case OnimotionType.FadeOutDown.name():
            fadeOutDown(completion)
        case OnimotionType.FadeOutUp.name():
            fadeOutUp(completion)
        case OnimotionType.SqueezeFadeInLeft.name():
            squeezeFadeInLeft()
        case OnimotionType.SqueezeFadeInRight.name():
            squeezeFadeInRight()
        case OnimotionType.SqueezeFadeInDown.name():
            squeezeFadeInDown()
        case OnimotionType.SqueezeFadeInUp.name():
            squeezeFadeInUp()
        case OnimotionType.SqueezeFadeOutLeft.name():
            squeezeFadeOutLeft()
        case OnimotionType.SqueezeFadeOutRight.name():
            squeezeFadeOutRight()
        case OnimotionType.SqueezeFadeOutDown.name():
            squeezeFadeOutDown()
        case OnimotionType.SqueezeFadeOutUp.name():
            squeezeFadeOutUp()
        case OnimotionType.ZoomIn.name():
            zoomIn(completion)
        case OnimotionType.ZoomOut.name():
            zoomOut(completion)
        case OnimotionType.Shake.name():
            shake(completion)
        case OnimotionType.Pop.name():
            pop(completion)
        case OnimotionType.FlipX.name():
            flipX(completion)
        case OnimotionType.FlipY.name():
            flipY(completion)
        case OnimotionType.Morph.name():
            morph(completion)
        case OnimotionType.Squeeze.name():
            squeeze(completion)
        case OnimotionType.Flash.name():
            flash(completion)
        case OnimotionType.Wobble.name():
            wobble(completion)
        case OnimotionType.Swing.name():
            swing(completion)
        case OnimotionType.Rotate.name():
            rotate(completion: completion)
        case OnimotionType.RotateCCW.name():
            rotate(clockwise: false, completion: completion)
        case OnimotionType.MoveTo.name():
            moveTo(completion)
        case OnimotionType.MoveBy.name():
            moveBy(completion)
        default:
            return
        }
    }
    
    /**
     `autoRunAnimation` method, should be called in layoutSubviews() method
     */
    func autoRunAnimation() {
        if autoRun {
            autoRun = false
            animate()
        }
    }
    
    // MARK: - Animation Func
    
    public func slideInLeft(completion: OnimotobleCompletion? = nil) {
        let x = -screenSize.width * force
        animateInWithX(x, completion: completion)
    }
    
    public func slideInRight(completion: OnimotobleCompletion? = nil) {
        let x = screenSize.width * force
        animateInWithX(x, completion: completion)
    }
    
    public func slideInDown(completion: OnimotobleCompletion? = nil) {
        let y = -screenSize.height * force
        animateInWithY(y, completion: completion)
    }
    
    public func slideInUp(completion: OnimotobleCompletion? = nil) {
        let y = screenSize.height * force
        animateInWithY(y, completion: completion)
    }
    
    public func slideOutLeft(completion: OnimotobleCompletion? = nil) {
        let x = -screenSize.width * force
        animateOutWithX(x, alpha: 1, completion: completion)
    }
    
    public func slideOutRight(completion: OnimotobleCompletion? = nil) {
        let x = screenSize.width * force
        animateOutWithX(x, alpha: 1, completion: completion)
    }
    
    public func slideOutDown(completion: OnimotobleCompletion? = nil) {
        let y = screenSize.height * force
        animateOutWithY(y, alpha: 1, completion: completion)
    }
    
    public func slideOutUp(completion: OnimotobleCompletion? = nil) {
        let y = -screenSize.height * force
        animateOutWithY(y, alpha: 1, completion: completion)
    }
    
    public func squeezeInLeft(completion: OnimotobleCompletion? = nil) {
        let x = -screenSize.width * force
        let scaleX = 3 * force
        animateInWithX(x, scaleX: scaleX, completion: completion)
    }
    
    public func squeezeInRight(completion: OnimotobleCompletion? = nil) {
        let x = screenSize.width * force
        let scaleX = 3 * force
        animateInWithX(x, scaleX: scaleX, completion: completion)
    }
    
    public func squeezeInDown(completion: OnimotobleCompletion? = nil) {
        let y = -screenSize.height * force
        let scaleY = 3 * force
        animateInWithY(y, scaleY: scaleY, completion: completion)
    }
    
    public func squeezeInUp(completion: OnimotobleCompletion? = nil) {
        let y = screenSize.height * force
        let scaleY = 3 * force
        animateInWithY(y, scaleY: scaleY, completion: completion)
    }
    
    public func squeezeOutLeft(completion: OnimotobleCompletion? = nil) {
        let x = -screenSize.width * force
        let scaleX = 3 * force
        animateOutWithX(x, scaleX: scaleX, alpha: 1, completion: completion)
    }
    
    public func squeezeOutRight(completion: OnimotobleCompletion? = nil) {
        let x = screenSize.width * force
        let scaleX = 3 * force
        animateOutWithX(x, scaleX: scaleX, alpha: 1, completion: completion)
    }
    
    public func squeezeOutDown(completion: OnimotobleCompletion? = nil) {
        let y = screenSize.height * force
        let scaleY = 3 * force
        animateOutWithY(y, scaleY: scaleY, alpha: 1, completion: completion)
    }
    
    public func squeezeOutUp(completion: OnimotobleCompletion? = nil) {
        let y = -screenSize.height * force
        let scaleY = 3 * force
        animateOutWithY(y, scaleY: scaleY, alpha: 1, completion: completion)
    }
    
    public func fadeInLeft(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        slideInLeft(completion)
    }
    
    public func fadeInRight(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        slideInRight(completion)
    }
    
    public func fadeInDown(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        slideInDown(completion)
    }
    
    public func fadeInUp(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        slideInUp(completion)
    }
    
    public func fadeOutLeft(completion: OnimotobleCompletion? = nil) {
        let x = -screenSize.width * force
        animateOutWithX(x, alpha: 0, completion: completion)
    }
    
    public func fadeOutRight(completion: OnimotobleCompletion? = nil) {
        let x = screenSize.width * force
        animateOutWithX(x, alpha: 0, completion: completion)
    }
    
    public func fadeOutDown(completion: OnimotobleCompletion? = nil) {
        let y = screenSize.height * force
        animateOutWithY(y, alpha: 0, completion: completion)
    }
    
    public func fadeOutUp(completion: OnimotobleCompletion? = nil) {
        let y = -screenSize.height * force
        animateOutWithY(y, alpha: 0, completion: completion)
    }
    
    public func squeezeFadeInLeft(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        squeezeInLeft(completion)
    }
    
    public func squeezeFadeInRight(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        squeezeInRight(completion)
    }
    
    public func squeezeFadeInDown(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        squeezeInDown(completion)
    }
    
    public func squeezeFadeInUp(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        squeezeInUp(completion)
    }
    
    public func squeezeFadeOutLeft(completion: OnimotobleCompletion? = nil) {
        let x = -screenSize.width * force
        let scaleX = 3 * force
        animateOutWithX(x, scaleX: scaleX, alpha: 0, completion: completion)
    }
    
    public func squeezeFadeOutRight(completion: OnimotobleCompletion? = nil) {
        let x = screenSize.width * force
        let scaleX = 3 * force
        animateOutWithX(x, scaleX: scaleX, alpha: 0, completion: completion)
    }
    
    public func squeezeFadeOutDown(completion: OnimotobleCompletion? = nil) {
        let y = screenSize.height * force
        let scaleY = 3 * force
        animateOutWithY(y, scaleY: scaleY, alpha: 0, completion: completion)
    }
    
    public func squeezeFadeOutUp(completion: OnimotobleCompletion? = nil) {
        let y = -screenSize.height * force
        let scaleY = 3 * force
        animateOutWithY(y, scaleY: scaleY, alpha: 0, completion: completion)
    }
    
    public func fadeIn(completion: OnimotobleCompletion? = nil) {
        alpha = 0
        animateWithAlpha(1, completion: completion)
    }
    
    public func fadeOut(completion: OnimotobleCompletion? = nil) {
        alpha = 1
        animateWithAlpha(0, completion: completion)
    }
    
    public func fadeOutIn(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 1
            animation.toValue = 0
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.duration = CFTimeInterval(self.duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            animation.autoreverses = true
            self.layer.addAnimation(animation, forKey: "fade")
            }, completion: completion)
    }
    
    public func fadeInOut(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 0
            animation.toValue = 1
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.duration = CFTimeInterval(self.duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            animation.autoreverses = true
            animation.removedOnCompletion = false
            self.layer.addAnimation(animation, forKey: "fade")
            },
                        completion: {
                            self.alpha = 0
                            completion?()
        })
    }
    
    public func zoomIn(completion: OnimotobleCompletion? = nil) {
        let scaleX = 2 * force
        let scaleY = 2 * force
        alpha = 0
        let toAlpha: CGFloat = 1
        animateInWithScaleX(scaleX, scaleY: scaleY, alpha: toAlpha, completion: completion)
    }
    
    public func zoomOut(completion: OnimotobleCompletion? = nil) {
        let scaleX = 2 * force
        let scaleY = 2 * force
        alpha = 1
        let toAlpha: CGFloat = 0
        animateOutWithScaleX(scaleX, scaleY: scaleY, alpha: toAlpha, completion: completion)
    }
    
    public func shake(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let animation = CAKeyframeAnimation(keyPath: "position.x")
            animation.values = [0, 30 * self.force, -30 * self.force, 30 * self.force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.duration = CFTimeInterval(self.duration)
            animation.additive = true
            animation.repeatCount = self.repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            self.layer.addAnimation(animation, forKey: "shake")
            }, completion: completion)
    }
    
    public func pop(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let animation = CAKeyframeAnimation(keyPath: "transform.scale")
            animation.values = [0, 0.2 * self.force, -0.2 * self.force, 0.2 * self.force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.duration = CFTimeInterval(self.duration)
            animation.additive = true
            animation.repeatCount = self.repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            self.layer.addAnimation(animation, forKey: "pop")
            }, completion: completion)
    }
    
    public func morph(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let morphX = CAKeyframeAnimation(keyPath: "transform.scale.x")
            morphX.values = [1, 1.3 * self.force, 0.7, 1.3 * self.force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            let morphY = CAKeyframeAnimation(keyPath: "transform.scale.y")
            morphY.values = [1, 0.7, 1.3 * self.force, 0.7, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            let animationGroup = CAAnimationGroup()
            animationGroup.animations = [morphX, morphY]
            animationGroup.duration = CFTimeInterval(self.duration)
            animationGroup.repeatCount = self.repeatCount
            animationGroup.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            self.layer.addAnimation(animationGroup, forKey: "morph")
            }, completion: completion)
    }
    
    public func squeeze(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let squeezeX = CAKeyframeAnimation(keyPath: "transform.scale.x")
            squeezeX.values = [1, 1.5 * self.force, 0.5, 1.5 * self.force, 1]
            squeezeX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            squeezeX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            let squeezeY = CAKeyframeAnimation(keyPath: "transform.scale.y")
            squeezeY.values = [1, 0.5, 1, 0.5, 1]
            squeezeY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            squeezeY.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            let animationGroup = CAAnimationGroup()
            animationGroup.animations = [squeezeX, squeezeY]
            animationGroup.duration = CFTimeInterval(self.duration)
            animationGroup.repeatCount = self.repeatCount
            animationGroup.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            self.layer.addAnimation(animationGroup, forKey: "squeeze")
            }, completion: completion)
    }
    
    public func flipX(completion: OnimotobleCompletion? = nil) {
        let scaleX: CGFloat = 1
        let scaleY: CGFloat = -1
        animateInWithScaleX(scaleX, scaleY: scaleY, alpha: 1, completion: completion)
    }
    
    public func flipY(completion: OnimotobleCompletion? = nil) {
        let scaleX: CGFloat = -1
        let scaleY: CGFloat = 1
        animateInWithScaleX(scaleX, scaleY: scaleY, alpha: 1, completion: completion)
    }
    
    public func flash(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = CFTimeInterval(self.duration)
            animation.repeatCount = self.repeatCount * 2.0
            animation.autoreverses = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            self.layer.addAnimation(animation, forKey: "flash")
            }, completion: completion)
    }
    
    public func wobble(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
            rotation.values = [0, 0.3 * self.force, -0.3 * self.force, 0.3 * self.force, 0]
            rotation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            rotation.additive = true
            
            let positionX = CAKeyframeAnimation(keyPath: "position.x")
            positionX.values = [0, 30 * self.force, -30 * self.force, 30 * self.force, 0]
            positionX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            positionX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            positionX.additive = true
            
            let animationGroup = CAAnimationGroup()
            animationGroup.animations = [rotation, positionX]
            animationGroup.duration = CFTimeInterval(self.duration)
            animationGroup.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            animationGroup.repeatCount = self.repeatCount
            self.layer.addAnimation(animationGroup, forKey: "wobble")
            }, completion: completion)
    }
    
    public func swing(completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
            animation.values = [0, 0.3 * self.force, -0.3 * self.force, 0.3 * self.force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(self.duration)
            animation.additive = true
            animation.repeatCount = self.repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            self.layer.addAnimation(animation, forKey: "swing")
            }, completion: completion)
    }
    
    public func rotate(clockwise clockwise: Bool = true, completion: OnimotobleCompletion? = nil) {
        CALayer.animate({
            let animation = CABasicAnimation(keyPath: "transform.rotation")
            animation.fromValue = clockwise ? 0 : ((360 * M_PI) / 180)
            animation.toValue = clockwise ? ((360 * M_PI) / 180) : 0
            animation.duration = CFTimeInterval(self.duration)
            animation.repeatCount = self.repeatCount
            animation.autoreverses = false
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(self.delay)
            self.layer.addAnimation(animation, forKey: "rotate")
            }, completion: completion)
    }
    
    public func moveTo(completion: OnimotobleCompletion? = nil) {
        if x.isNaN && y.isNaN {
            return
        }
        
        // Get the absolute position
        let absolutePosition = convertPoint(frame.origin, toView: nil)
        var xOffsetToMove: CGFloat
        if x.isNaN {
            xOffsetToMove = 0
        } else {
            xOffsetToMove = x - absolutePosition.x
        }
        
        var yOffsetToMove: CGFloat
        if y.isNaN {
            yOffsetToMove = 0
        } else {
            yOffsetToMove = y - absolutePosition.y
        }
        
        animateToWithX(xOffsetToMove, y: yOffsetToMove, completion: completion)
    }
    
    public func moveBy(completion: OnimotobleCompletion? = nil) {
        if x.isNaN && y.isNaN {
            return
        }
        
        let xOffsetToMove = x.isNaN ? 0: x
        let yOffsetToMove = y.isNaN ? 0: y
        animateToWithX(xOffsetToMove, y: yOffsetToMove, completion: completion)
    }
    
    // MARK: - Private
    private func animateInWithX(x: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateIn(x, 0, 1, 1, 1, completion)
    }
    
    private func animateOutWithX(x: CGFloat, alpha: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateOut(x, 0, 1, 1, alpha, completion)
    }
    
    private func animateInWithY(y: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateIn(0, y, 1, 1, 1, completion)
    }
    
    private func animateOutWithY(y: CGFloat, alpha: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateOut(0, y, 1, 1, alpha, completion)
    }
    
    private func animateInWithX(x: CGFloat, scaleX: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateIn(x, 0, scaleX, 1, 1, completion)
    }
    
    private func animateOutWithX(x: CGFloat, scaleX: CGFloat, alpha: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateOut(x, 0, scaleX, 1, alpha, completion)
    }
    
    private func animateInWithY(y: CGFloat, scaleY: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateIn(0, y, 1, scaleY, 1, completion)
    }
    
    private func animateOutWithY(y: CGFloat, scaleY: CGFloat, alpha: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateOut(0, y, 1, scaleY, alpha, completion)
    }
    
    private func animateInWithScaleX(scaleX: CGFloat, scaleY: CGFloat, alpha: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateIn(0, 0, scaleX, scaleY, alpha, completion)
    }
    
    private func animateOutWithScaleX(scaleX: CGFloat, scaleY: CGFloat, alpha: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateOut(0, 0, scaleX, scaleY, alpha, completion)
    }
    
    private func animateWithAlpha(alpha: CGFloat, completion: OnimotobleCompletion? = nil) {
        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [],
                                   animations: {
                                    self.alpha = alpha
            },
                                   completion: { completed in
                                    if completed {
                                        completion?()
                                    }
            }
        )
    }
    
    private func animateToWithX(x: CGFloat, y: CGFloat, completion: OnimotobleCompletion? = nil) {
        animateTo(x, y, completion)
    }
    
    private func animateTo(x: CGFloat, _ y: CGFloat, _ completion: OnimotobleCompletion? = nil) {
        let translate = CGAffineTransformMakeTranslation(x, y)
        UIView.animateWithDuration(duration, delay:delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [],
                                   animations: {
                                    self.transform = translate
            },
                                   completion: { completed in
                                    if completed {
                                        completion?()
                                    }
            }
        )
    }
    
    private func animateIn(x: CGFloat, _ y: CGFloat, _ scaleX: CGFloat, _ scaleY: CGFloat, _ alpha: CGFloat, _ completion: OnimotobleCompletion? = nil) {
        let translate = CGAffineTransformMakeTranslation(x, y)
        let scale = CGAffineTransformMakeScale(scaleX, scaleY)
        let translateAndScale = CGAffineTransformConcat(translate, scale)
        transform = translateAndScale
        
        UIView.animateWithDuration(duration, delay:delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [],
                                   animations: {
                                    self.transform = CGAffineTransformIdentity
                                    self.alpha = alpha
            },
                                   completion: { completed in
                                    if completed {
                                        completion?()
                                    }
            }
        )
    }
    
    private func animateOut(x: CGFloat, _ y: CGFloat, _ scaleX: CGFloat, _ scaleY: CGFloat, _ alpha: CGFloat, _ completion: OnimotobleCompletion? = nil) {
        let translate = CGAffineTransformMakeTranslation(x, y)
        let scale = CGAffineTransformMakeScale(scaleX, scaleY)
        let translateAndScale = CGAffineTransformConcat(translate, scale)
        
        UIView.animateWithDuration(duration, delay:delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [],
                                   animations: {
                                    self.transform = translateAndScale
                                    self.alpha = alpha
            },
                                   completion: { completed in
                                    if completed {
                                        completion?()
                                    }
            }
        )
    }
    
    // MARK: Private helper
    private var screenSize: CGSize {
        return self.window?.screen.bounds.size ?? CGSize.zero
    }
}
