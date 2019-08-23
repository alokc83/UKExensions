//
//  Segue.swift
//
//  Created by Alok Choudhary on 2/7/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

public struct Segue: Equatable, Comparable {
    public var identifier: String
    public var destination: UIViewController.Type?

    public init(segueIdentifier: String, destination: UIViewController.Type? = nil) {
        self.identifier = segueIdentifier
        self.destination = destination
    }

    public init(_ segueIdentifier: String, destination: UIViewController.Type? = nil) {
        self.identifier = segueIdentifier
        self.destination = destination
    }
}

public func == (lhs: Segue, rhs: Segue) -> Bool {
    return lhs.identifier == rhs.identifier
}

public func < (lhs: Segue, rhs: Segue) -> Bool {
    return lhs.identifier < rhs.identifier
}

public extension UIViewController {
    func performSegue(_ segue: Segue, sender: Any?) {
        self.performSegue(withIdentifier: segue.identifier, sender: sender)
    }
}
