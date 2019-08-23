//
//  UIView+Extension.swift
//
//  Created by Alok Choudhary on 12/5/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

public extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    class func getView(for name: String) -> UIView? {
        return Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView
    }
}
