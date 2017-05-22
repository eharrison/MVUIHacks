//
//  UIView+Animation.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 07/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

extension UIView{
    
    public func animateShowPopingUp(duration: Double = 0.4, scaleIn: CGFloat = 0.1, scaleOut: CGFloat = 1.05, alphaIn: CGFloat = 0, _ completion:(() -> Void)? = nil){
        isHidden = false
        alpha = alphaIn
        transform = CGAffineTransform(scaleX: scaleIn, y: scaleIn)
        
        UIView.animate(withDuration: duration*0.7, animations: {
            self.transform = CGAffineTransform(scaleX: scaleOut, y: scaleOut)
            self.alpha = 1
        }, completion: { (didComplete) in
            //if didComplete {
            UIView.animate(withDuration: duration*0.3, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: { (didComplete) in
                //if didComplete {
                completion?()
                //}
            })
            //}
        })
    }
    
    public func animateFadeInUp(duration: Double = 0.3, alphaIn: CGFloat = 0, _ completion:(() -> Void)? = nil){
        self.alpha = alphaIn
        
        let center = self.center
        self.center = CGPoint(x: self.center.x, y: self.superview!.frame.size.height)
        
        UIView.animate(withDuration: duration, animations: {
            self.center = center
            self.alpha = 1
        }, completion: { (didComplete) in
            //if didComplete {
            completion?()
            //}
        })
    }
    
    public func animateFadeIn(duration: Double = 0.3, alphaIn: CGFloat = 0, _ completion:(() -> Void)? = nil){
        if !self.isHidden {
            return
        }
        
        self.isHidden = false
        self.alpha = alphaIn
        
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: { (didComplete) in
            //if didComplete {
            completion?()
            completion?()
            //}
        })
    }
    
    public func animateFadeOut(duration: Double = 0.3, _ completion:(() -> Void)? = nil){
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: { (didComplete) in
            //if didComplete {
            completion?()
            //}
        })
    }
    
    public func animateFadeAway(_ completion:(() -> Void)? = nil){
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { (didComplete) in
            //if didComplete {
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                self.alpha = 0
            }, completion: { (didComplete) in
                //if didComplete {
                self.isHidden = true
                completion?()
                //}
            })
            //}
        })
    }
    
    public func animateTouchDown(duration: Double = 0.1, durationOut: Double = 0.2, scaleIn: CGFloat = 0.9, alphaIn: CGFloat = 0.9, autoAnimateUp: Bool = true, halfWay:(() -> Void)? = nil, _ completed:(() -> Void)? = nil){
        UIView.animate(withDuration: duration, animations: {
            self.alpha = alphaIn
            self.transform = CGAffineTransform(scaleX: scaleIn, y: scaleIn)
        }, completion: { (didComplete) in
            //if didComplete {
            halfWay?()
            
            if autoAnimateUp{
                self.animateTouchUp(duration: durationOut, {
                    completed?()
                })
            }
            //}
        })
    }
    
    public func animateTouchUp(duration: Double = 0.2, _ completed:(() -> Void)? = nil){
        UIView .animate(withDuration: duration, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: { (didComplete) in
            //if didComplete {
            completed?()
            //}
        })
    }
    
    public func animateFadeOutDown(duration: Double = 0.3, _ completion:(() -> Void)? = nil){
        UIView.animate(withDuration: duration, animations: {
            if let superview = self.superview {
                self.center = CGPoint(x: self.center.x, y: superview.frame.size.height)
            }
            self.alpha = 0
        }, completion: { (didComplete) in
            //if didComplete {
            completion?()
            //}
        })
    }
    
}
