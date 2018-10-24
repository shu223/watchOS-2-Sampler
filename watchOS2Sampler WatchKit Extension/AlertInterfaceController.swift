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

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
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
            style: WKAlertActionStyle.default) { () -> Void in
                
                print("Default")
        }
        
        let cancelAction = WKAlertAction(
            title: "Cancel",
            style: WKAlertActionStyle.cancel) { () -> Void in
                
                print("Cancel")
        }
        
        let destructiveAction = WKAlertAction(
            title: "Destructive",
            style: WKAlertActionStyle.destructive) { () -> Void in
                
                print("Destructive")
        }

        var actions = [defaultAction, destructiveAction]
        
        // exactly two actions are needed for WKAlertControllerStyleSideBySideButtonsAlert
        if style != WKAlertControllerStyle.sideBySideButtonsAlert {
            actions.append(cancelAction)
        }
        
        presentAlert(
            withTitle: "SomeTitle",
            message: "SomeMessage",
            preferredStyle: style,
            actions: actions)
    }
    
    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func alertBtnTapped() {

        showAlertControllerWithStyle(style: WKAlertControllerStyle.alert)
    }

    @IBAction func sidebysideBtnTapped() {
        
        showAlertControllerWithStyle(style: WKAlertControllerStyle.sideBySideButtonsAlert)
    }

    @IBAction func actionSheetBtnTapped() {
        
        showAlertControllerWithStyle(style: WKAlertControllerStyle.actionSheet)
    }
}
