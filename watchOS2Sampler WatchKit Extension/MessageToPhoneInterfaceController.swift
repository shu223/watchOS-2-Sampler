//
//  MessageToPhoneInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/16.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class MessageToPhoneInterfaceController: WKInterfaceController, WCSessionDelegate {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Activate the session on both sides to enable communication.
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self // conforms to WCSessionDelegate
            session.activate()
        }
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
    // =========================================================================
    // MARK: - WCSessionDelegate
    
    @available(watchOSApplicationExtension 2.2, *)
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print(#function)
        print(session)
        print("reachable:\(session.isReachable)")
    }

    // Received message from iPhone
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print(#function)
        guard message["request"] as? String == "showAlert" else {return}

        let defaultAction = WKAlertAction(
            title: "OK",
            style: WKAlertActionStyle.default) { () -> Void in
        }
        let actions = [defaultAction]
            
        presentAlert(
            withTitle: "Message Received",
            message: "",
            preferredStyle: WKAlertControllerStyle.alert,
            actions: actions)
    }
    

    // =========================================================================
    // MARK: - Actions
    
    @IBAction func sendBtnTapped() {
        let message = ["request": "fireLocalNotification"]
        WCSession.default.sendMessage(
            message, replyHandler: { (replyMessage) -> Void in
                //
            }) { (error) -> Void in
                print(error.localizedDescription)
        }
    }
}
