//
//  UIDevice+Extension.swift
//
//  Created by Alok Choudhary on 12/5/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

extension UIDevice {
    static var isSimulator: Bool {
        #if IOS_SIMULATOR
        return true
        #else
        return false
        #endif
    }
}
