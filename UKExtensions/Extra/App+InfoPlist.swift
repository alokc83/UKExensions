//
//  App+InfoPlist.swift
//
//  Created by Alok Choudhary on 12/11/18.
//

import Foundation

struct InfoPlist {
    @discardableResult
    static func majorVersion(in plist: String? = nil) -> String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else { return "0.0.0" }
        debugPrint(version)
        return version
    }
    
    @discardableResult
    static func buildNumber(in plist: String? = nil) -> String {
        guard let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String else { return "0" }
        debugPrint(build)
        return build
    }
}
