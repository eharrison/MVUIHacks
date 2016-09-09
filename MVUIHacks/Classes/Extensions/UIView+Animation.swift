//
//  UIView+Animation.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 07/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

extension UIView{
    
    public func animateShowPopingUp(_ completion:(() -> Void)?){
        isHidden = false
        alpha = 0
        transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            self.alpha = 1
        }, completion: { (Bool) in
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: { (Bool) in
                completion?()
            }) 
        }) 
    }
    
    public func fadeInUp(_ completion:(() -> Void)?){
        self.alpha = 0
        
        let center = self.center
        self.center = CGPoint(x: self.center.x, y: self.superview!.frame.size.height)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.center = center
            self.alpha = 1
        }, completion: { (Bool) in
            completion?()
        }) 
    }
    
    public func animateFadeAway(_ completion:(() -> Void)?){
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { (Bool) in
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                self.alpha = 0
            }, completion: { (Bool) in
                self.isHidden = true
                completion?()
            }) 
        }) 
    }
    
    public func animateTouchDown(_ completion:((_ completed: Bool) -> Void)?){
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.9
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { (Bool) in
            completion?(false)
            UIView .animate(withDuration: 0.2, animations: {
                self.alpha = 1
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: { (Bool) in
                completion?(true)
            }) 
        }) 
    }
    
}
