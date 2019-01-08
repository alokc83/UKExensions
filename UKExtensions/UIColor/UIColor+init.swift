//
//  UIColor+init.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/7/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit

public extension UIColor {
    public convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let rMask = Int(color >> 16) & mask
        let gMask = Int(color >> 8) & mask
        let bMask = Int(color) & mask
        let red   = CGFloat(rMask) / 255.0
        let green = CGFloat(gMask) / 255.0
        let blue  = CGFloat(bMask) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    public func toHexString() -> String {
        var rFloat:CGFloat = 0
        var gFloat:CGFloat = 0
        var bFloat:CGFloat = 0
        var aFloat:CGFloat = 0
        getRed(&rFloat, green: &gFloat, blue: &bFloat, alpha: &aFloat)
        let rgb:Int = (Int)(rFloat*255)<<16 | (Int)(gFloat*255)<<8 | (Int)(bFloat*255)<<0
        return String(format:"#%06x", rgb)
    }
    
    public static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
