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

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Activate the session on both sides to enable communication.
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self // conforms to WCSessionDelegate
            session.activateSession()
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
    
    func sessionWatchStateDidChange(session: WCSession) {
        print(__FUNCTION__)
        print(session)
        print("reachable:\(session.reachable)")
    }

    // Received message from iPhone
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        print(__FUNCTION__)
        guard message["request"] as? String == "showAlert" else {return}

        let defaultAction = WKAlertAction(
            title: "OK",
            style: WKAlertActionStyle.Default) { () -> Void in
        }
        let actions = [defaultAction]
            
        self.presentAlertControllerWithTitle(
            "Message Received",
            message: "",
            preferredStyle: WKAlertControllerStyle.Alert,
            actions: actions)
    }
    

    // =========================================================================
    // MARK: - Actions
    
    @IBAction func sendBtnTapped() {
        let message = ["request": "fireLocalNotification"]
        WCSession.defaultSession().sendMessage(
            message, replyHandler: { (replyMessage) -> Void in
                //
            }) { (error) -> Void in
                print(error.localizedDescription)
        }
    }
}
