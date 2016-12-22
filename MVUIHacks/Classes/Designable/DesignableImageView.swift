//
//  DesignableImageView.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 08/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableImageView: UIImageView {
    
    var theContentMode = UIViewContentMode.scaleAspectFill
    
//    override open var contentMode: UIViewContentMode {
//        didSet {
//            theContentMode = contentMode
//        }
//    }
    
    override open var image: UIImage? {
        didSet {
            self.contentMode = theContentMode
        }
    }
    
    // MARK: - Shapes
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable open var placeholderImage: UIImage? = nil {
        didSet {
            self.image = placeholderImage
        }
    }
    
    @IBInspectable open var placeholderContentMode: Int = 0 {
        didSet {
            self.theContentMode = contentMode
            if let placeholderContentMode =  UIViewContentMode(rawValue: placeholderContentMode) {
                self.contentMode = placeholderContentMode
            }
        }
    }
    

}
