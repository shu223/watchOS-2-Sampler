//
//  ViewController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import UIKit
import WatchConnectivity


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // =========================================================================
    // MARK: - Actions
    
    @IBAction func sendToWatchBtnTapped(sender: UIButton!) {
        
        // check the reachablity
        if !WCSession.default.isReachable {
            
            let alert = UIAlertController(
                title: "Failed to send",
                message: "Apple Watch is not reachable.",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "OK",
                style: .cancel,
                handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }

        let message = ["request": "showAlert"]
        WCSession.default.sendMessage(message, replyHandler: { (replyMessage) in
            //
        }) { (error) in
            print(error)
        }
    }
}

