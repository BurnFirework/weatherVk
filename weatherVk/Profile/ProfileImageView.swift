//
//  ProfileImageView.swift
//  weatherVk
//
//  Created by Арина Соколова on 02.07.2022.
//

import UIKit

class ProfileImageView: UIView {
    
    @IBInspectable var opacity: CGFloat = 0.7 {
        didSet {
        setNeedsDisplay()
        }
    }
    
    @IBInspectable var radius: CGFloat = 8 {
        didSet {
        setNeedsDisplay()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
        setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layoutView()
    }
    
    func layoutView() {
        layer.cornerRadius = layer.bounds.width / 2 + 30
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = Float(opacity)
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize.zero
    }
}

