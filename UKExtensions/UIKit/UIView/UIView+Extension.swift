//
//  UIView+Extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/8/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

//TODO: Check if this is working in example project

#if canImport(UIKit) && os(iOS)

import UIKit
public extension UIView {
    public var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

public extension UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            guard let borderColor =  self.layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: borderColor)
        }
        
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable public var shadowColor: UIColor? {
        get {
            guard let shadowColor =  self.layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: shadowColor)
        }
        
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat {
        get {
            return CGFloat(self.layer.shadowOpacity)
        }
        
        set {
            self.layer.shadowOpacity = Float(newValue)
        }
    }
}

#endif
