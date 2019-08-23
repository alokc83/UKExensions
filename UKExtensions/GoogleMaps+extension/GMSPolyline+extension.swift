//
//  GMSPolyline+extension.swift
//  Shipwell
//
//  Created by Alok Choudhary on 2/21/19.
//  Copyright © 2019 Shipwell. All rights reserved.
//

import GoogleMaps

extension GMSPolyline {
    func colorized(isPickupRoute: Bool) {
        if isPickupRoute {
            strokeWidth = 2
            strokeColor = UIColor.PrimaryPalette.blue
        } else {
            strokeWidth = 1
            strokeColor = UIColor.SecondaryPalette.gray
        }
    }
}
