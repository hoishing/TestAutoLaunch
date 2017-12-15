//
//  AppDelegate.swift
//  AutoLaunchHelper
//
//  Created by Kelvin Ng on 8/6/2017.
//  Copyright © 2017 Kelvin Ng. All rights reserved.
//

import Cocoa

@NSApplicationMain
class HelperAppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = runningApps.contains {
            $0.bundleIdentifier == "your.domain.TestAutoLaunch"
        }
        
        if !isRunning {
            var path = Bundle.main.bundlePath as NSString
            for _ in 1...4 {
                path = path.deletingLastPathComponent as NSString
            }
            NSWorkspace.shared.launchApplication(path as String)
        }
    }
}

