//
//  ViewController.swift
//  TestAutoLaunch
//
//  Created by Kelvin Ng on 8/6/2017.
//  Copyright © 2017 Kelvin Ng. All rights reserved.
//

import Cocoa
import ServiceManagement

class ViewController: NSViewController {
    
    let helperBundleName = "your.domain.AutoLaunchHelper"

    @IBOutlet weak var autoLaunchCheckbox: NSButton!
    
    @IBAction func toggleAutoLaunch(_ sender: NSButton) {
        let isAuto = sender.state == .on
        SMLoginItemSetEnabled(helperBundleName as CFString, isAuto)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let foundHelper = NSWorkspace.shared.runningApplications.contains {
            $0.bundleIdentifier == helperBundleName
        }
        
        autoLaunchCheckbox.state = foundHelper ? .on : .off
    }
}

