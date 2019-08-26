//
//  UITextField+CGRect.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 2/7/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit
import Foundation

extension UITextField {
    open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
}

// MARK : UI related
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    func leftImageViewInTextField(imageName: String,
                                  imageViewRect: CGRect = CGRect(x: 10, y: 0, width: 50, height: 30),
                                  imageInsetValue: CGFloat = 2,
                                  imageTintColor: UIColor = .white) {
        let image = UIImage(named: imageName)!.withRenderingMode(.alwaysTemplate)
        image.resizableImage(withCapInsets: UIEdgeInsets(top: imageInsetValue, left: imageInsetValue, bottom: imageInsetValue, right: imageInsetValue))
        let imageView = UIImageView(frame: imageViewRect)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.tintColor = imageTintColor
        self.leftView = imageView
        self.leftViewMode = UITextField.ViewMode.always
    }
}
