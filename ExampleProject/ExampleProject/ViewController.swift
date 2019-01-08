//
//  ViewController.swift
//  ExampleProject
//
//  Created by Alok Choudhary on 1/8/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit
import UKExtensions

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if UIDevice.isSimulator{
            debugPrint("device is simulator")
        }
    }


}

