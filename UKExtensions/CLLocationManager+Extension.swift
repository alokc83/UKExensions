//
//  CLLocationManager+Extension.swift
//
//  Created by Alok Choudhary on 12/4/18.
//  Copyright © 2018 Alok Choudhary. All rights reserved.
//

import CoreLocation

extension CLLocationManager {

    static func locationPermissionManager(with locationAuthStatus: CLAuthorizationStatus, viewController: UIViewController? = nil) {
        switch locationAuthStatus {
        case .notDetermined:
            CLLocationManager().requestAlwaysAuthorization()
        case .denied, .restricted:

            if let viewController = viewController {
                self.init().showLocationAceessDeniedAlert(on: viewController, message: "📍Location service: Please enabled it from Settings.")
            }
        case .authorizedAlways: break
        case .authorizedWhenInUse:
            if let viewController = viewController {
                self.init().showLocationAceessDeniedAlert(on: viewController, message: "📍Location service: Please select 'Always' under location access")
            }
        }
    }
    
    private func showLocationAceessDeniedAlert(on viewController: UIViewController, message: String) {
            let alertController = UIAlertController(title: "Permission update needed", message: message, preferredStyle: .alert)
            let settingAction = UIAlertAction(title: "Open Settings", style: .default) { _ in
                if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSettings, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
                }
        }
        
        alertController.addAction(settingAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
private func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
