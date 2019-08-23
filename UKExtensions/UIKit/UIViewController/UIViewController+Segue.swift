//
//  UIViewController+Segue.swift
//
//  Created by Alok Choudhary on 2/7/19.
//  Copyright © 2019. All rights reserved.
//

import ObjectiveC
import UIKit

public protocol Performable {
    associatedtype Destination
}

public protocol Identifiable {
    var identifier: String { get }
    static var identifier: String { get }
}

public extension Identifiable {
    public var identifier: String {
        return String(describing: self)
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Identifiable {}
extension UITableViewCell: Identifiable {}
extension UITableViewHeaderFooterView: Identifiable {}
extension UIViewController: Identifiable {}

extension UIViewController: Performable {
    public typealias Destination = UIViewController
    
    private struct AssociatedKeys {
        static var prepareDestination: UInt8 = 0
        static var destinationIdentifier: UInt8 = 1
    }
    
    private var prepareDestination: ((Destination) -> Void)? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.prepareDestination) as? ((UIViewController) -> Void) }
        set { objc_setAssociatedObject(self, &AssociatedKeys.prepareDestination, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var destinationIdentifier: String? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.destinationIdentifier) as? String }
        set { objc_setAssociatedObject(self, &AssociatedKeys.destinationIdentifier, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    public func performSegue(_ segue: Segue, prepareDestination: @escaping (Destination) -> Void = { _ in }) {
        destinationIdentifier = segue.destination?.identifier
        self.prepareDestination = prepareDestination
        performSegue(withIdentifier: segue.identifier, sender: nil)
    }
}

extension UIViewController {
    static func prepareSwizzleMethods() {
        guard self === UIViewController.self else { return }
        
        let swizzlingClosure: () = {
            UIViewController().swizzlePrepareForSegue()
        }()
        swizzlingClosure
    }
    
    fileprivate func swizzlePrepareForSegue() {
        let originalSelector = #selector(UIViewController.prepare(for:sender:))
        let swizzledSelector = #selector(UIViewController.sw_prepare(for:sender:))
        
        let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector)!
        
        let flag = class_addMethod(UIViewController.self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if flag {
            class_replaceMethod(UIViewController.self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    @objc func sw_prepare(for segue: UIStoryboardSegue, sender: Any?) {
        defer { self.prepareDestination = nil }
        sw_prepare(for: segue, sender: sender)
        prepareDestination?(find(destinationIdentifier, from: segue.destination))
    }
    
    private func find(_ identifier: String?, from root: UIViewController) -> UIViewController {
        guard let identifier = identifier else { return root }
        
        for childDestination in root.children {
            if childDestination.identifier == identifier {
                return childDestination
            } else {
                return find(identifier, from: childDestination)
            }
        }
        
        return root
    }
}
