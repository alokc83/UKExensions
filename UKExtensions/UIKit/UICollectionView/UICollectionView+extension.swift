//
//  UICollectionView+extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 3/1/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit
extension UICollectionView {
    func setEmptyMessage(_ message: String) {
        guard self.numberOfItems() == 0 else {
            return
        }
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.semibold)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
    
    public func numberOfItems() -> Int {
        var section = 0
        var itemsCount = 0
        while section < self.numberOfSections {
            itemsCount += numberOfItems(inSection: section)
            section += 1
        }
        return itemsCount
    }
}

