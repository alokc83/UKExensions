//
//  LocalAuthentication+Extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/8/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

#if os(iOS) && canImport(LocalAuthentication)

import LocalAuthentication

extension LAContext {
    enum BiometricType: String {
        case none
        case touchID
        case faceID
    }
    
    var biometricType: BiometricType {
        var error: NSError?
        
        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            // Capture these recoverable error thru Crashlytics
            return .none
        }
        
        if #available(iOS 11.0, *) {
            switch self.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            }
        } else {
            return  self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }
    
    static public func validateUserWithTouchIdIfPossible(_ reasonText: String, completion: @escaping (_ success: Bool) -> Void) {
        let context = LAContext()
        let error = NSErrorPointer.init(nilLiteral: ())
        let policy: LAPolicy
        if #available(iOS 9, *) {
            policy = .deviceOwnerAuthentication
        } else {
            policy = .deviceOwnerAuthenticationWithBiometrics
        }
        if context.canEvaluatePolicy(policy, error: error) {
            context.evaluatePolicy(policy, localizedReason: reasonText, reply: { (success, _) -> Void in
                completion(success)
            })
        } else {
            completion(false)
        }
    }
}

#endif
