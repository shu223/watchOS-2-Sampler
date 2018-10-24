//
//  AppDelegate.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import UIKit
import WatchConnectivity
import HealthKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let settings = UIUserNotificationSettings(
            types: [.badge, .sound, .alert],
            categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)

        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self // conforms to WCSessionDelegate
            session.activate()
        }
        
        return true
    }

    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        let healthStore = HKHealthStore()
        guard HKHealthStore.isHealthDataAvailable() else {
            return
        }
        
        let dataTypes = Set([HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!])
        healthStore.requestAuthorization(toShare: nil, read: dataTypes, completion: { (result, error) -> Void in
        })
    }
    
    // =========================================================================
    // MARK: - WCSessionDelegate

    func sessionDidBecomeInactive(_ session: WCSession) {
        print(#function)
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print(#function)
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print(#function)
        print(session)
        print("reachable:\(session.isReachable)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print(#function)
        guard message["request"] as? String == "fireLocalNotification" else {return}
        
        let localNotification = UILocalNotification()
        localNotification.alertBody = "Message Received!"
        localNotification.fireDate = Date()
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
}

