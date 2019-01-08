//
//  UIDevice+Extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/8/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit

public extension UIDevice {
    public static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
}
