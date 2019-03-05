//
//  UIApplication+Extension.swift
//
//  Created by Alok Choudhary on 2/7/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }

    func showIndicatorOnStausBar() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func hideIndicatorOnStatusBar() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    static func networkActivityIndicatorStatusBar(show visible: Bool) {
        if visible {
            UIApplication.shared.showIndicatorOnStausBar()
        } else {
            UIApplication.shared.hideIndicatorOnStatusBar()
        }
    }
}
#endif
