//
//  UIImage+Extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/11/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit

extension UIImage {
    var circleMask: UIImage {
        let square = size.width < size.height ? CGSize(width: size.width, height: size.width) : CGSize(width: size.height, height: size.height)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}

extension UIImage {
    func saveImageToDisk() -> URL? {
        let filename = "userdocument-\(UUID().uuidString).jpg"
        
        let fullPath = getCachesDirectoryPath().appendingPathComponent(filename)
        
        do {
            try self.jpegData(compressionQuality: 0.6)?.write(to: fullPath)
        } catch {
            return nil
        }
        
        return fullPath
    }
    
    func getDocumentsPath() -> URL {
        let fileManager = FileManager.default
        
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        var documentsDirectory = paths[0]
        documentsDirectory.appendPathComponent("Images")
        
        if !fileManager.fileExists(atPath: documentsDirectory.path) {
            do {
                try fileManager.createDirectory(atPath: documentsDirectory.path, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                debugPrint(error.localizedDescription)
            }
        }
        
        return documentsDirectory
    }
    
    func getCachesDirectoryPath() -> URL {
        let fileManager = FileManager.default
        
        let paths = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        var documentsDirectory = paths[0]
        documentsDirectory.appendPathComponent("Images")
        
        if !fileManager.fileExists(atPath: documentsDirectory.path) {
            do {
                try fileManager.createDirectory(atPath: documentsDirectory.path, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                debugPrint(error.localizedDescription)
            }
        }
        
        return documentsDirectory
    }
    
}

