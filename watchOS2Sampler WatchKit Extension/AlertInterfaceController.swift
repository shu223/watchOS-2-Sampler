//
//  AlertInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/11.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class AlertInterfaceController: WKInterfaceController {

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
    private func showAlertControllerWithStyle(style: WKAlertControllerStyle!) {
        
        let defaultAction = WKAlertAction(
            title: "Default",
            style: WKAlertActionStyle.Default) { () -> Void in
                
                print("Default")
        }
        
        let cancelAction = WKAlertAction(
            title: "Cancel",
            style: WKAlertActionStyle.Cancel) { () -> Void in
                
                print("Cancel")
        }
        
        let destructiveAction = WKAlertAction(
            title: "Destructive",
            style: WKAlertActionStyle.Destructive) { () -> Void in
                
                print("Destructive")
        }

        var actions = [defaultAction, destructiveAction]
        
        // exactly two actions are needed for WKAlertControllerStyleSideBySideButtonsAlert
        if style != WKAlertControllerStyle.SideBySideButtonsAlert {
            actions.append(cancelAction)
        }
        
        self.presentAlertControllerWithTitle(
            "SomeTitle",
            message: "SomeMessage",
            preferredStyle: style,
            actions: actions)
    }
    
    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func alertBtnTapped() {

        self.showAlertControllerWithStyle(WKAlertControllerStyle.Alert)
    }

    @IBAction func sidebysideBtnTapped() {
        
        self.showAlertControllerWithStyle(WKAlertControllerStyle.SideBySideButtonsAlert)
    }

    @IBAction func actionSheetBtnTapped() {
        
        self.showAlertControllerWithStyle(WKAlertControllerStyle.ActionSheet)
    }
}
