//
//  HeartRateInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit


class HeartRateInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var label: WKInterfaceLabel!
    let healthStore = HKHealthStore()
    let heartRateType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
        
        guard HKHealthStore.isHealthDataAvailable() else {
            self.label.setText("not available")
            return
        }
        
        let dataTypes = Set([heartRateType])
        
        healthStore.requestAuthorizationToShareTypes(nil, readTypes: dataTypes) { (success, error) -> Void in
            guard success else {
                self.label.setText("not allowed")
                return
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    // =========================================================================
    // MARK: - Actions
    
//    @IBAction func fetchBtnTapped() {
//        
//        let calendar = NSCalendar.currentCalendar()
//        let now = NSDate()
//        let components = calendar.components(.Day, fromDate: now)
//        let startDate = calendar.dateFromComponents(components)!
//        let endData   = calendar.dateByAddingUnit(, value: 1, toDate: startDate, options: 0)
//    }
}
