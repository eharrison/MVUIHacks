//
//  DesignableView.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 06/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

enum ShapeType: Int {
    case `default` = 0
    case hexagon = 1
    case hexagonVertical = 2
}

@IBDesignable
open class DesignableView: UIView {
    
    // MARK: - Shapes
    
    @IBInspectable open var shapeType: Int = 0{
        didSet{
            updateShape(shapeType)
        }
    }
    
    @IBInspectable var autoRadius:Bool = false {
        didSet {
            if autoRadius {
                cornerRadius = layer.frame.height / 2
            }
        }
    }
    
    open func updateShape(_ shapeType: Int){
        switch shapeType {
        case ShapeType.hexagon.rawValue:
            self.addHexagonalMask(0)
            break
        case ShapeType.hexagonVertical.rawValue:
            self.addHexagonalMask(CGFloat(Double.pi/2))
            break
        default:
            break
        }
    }
    
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
    
    // MARK: - Colors
    
    @IBInspectable open var gradientTopColor: UIColor = UIColor.clear {
        didSet{
            self.addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        }
    }
    
    @IBInspectable open var gradientBottomColor: UIColor = UIColor.clear {
        didSet{
            self.addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        }
    }
    
    open override func layoutSubviews() {
        addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        updateShape(shapeType)
        if autoRadius {
            cornerRadius = layer.frame.height / 2
        }
    }
}
