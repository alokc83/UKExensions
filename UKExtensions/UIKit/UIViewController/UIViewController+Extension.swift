//
//  UIViewController+Extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/8/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

public extension UIViewController {
    public func dismiss(_ sender: Any? = nil) {
        self.view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    public var topPresentingViewController: UIViewController? {
        if var viewController = UIApplication.shared.keyWindow?.rootViewController {
            while viewController.presentingViewController != nil {
                guard let nextViewController = viewController.presentingViewController else { continue }
                viewController = nextViewController
            }
            return viewController
        }
        return nil
    }
    
    public var topPresentedViewController: UIViewController? {
        if var viewController = UIApplication.shared.keyWindow?.rootViewController {
            while viewController.presentedViewController != nil {
                guard let nextViewController = viewController.presentedViewController else { continue }
                viewController = nextViewController
            }
            return viewController
        }
        return nil
    }
    
    public func isModal(_ strict: Bool = true) -> Bool {
        guard let navigationController = self.navigationController
            else { return false }
        
        if let viewController = navigationController.viewControllers.first,
            viewController != self && strict {
            return false
        }
        
        if self.presentingViewController != nil {
            return true
        }
        
        if let viewController = navigationController.presentingViewController,
            viewController.presentedViewController == self.navigationController {
            return true
        }
        
        if let tabBarController = self.tabBarController,
            tabBarController.presentingViewController is UITabBarController {
            return true
        }
        
        return false
    }
}

