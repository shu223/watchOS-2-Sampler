//
//  PedometerInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion


class PedometerInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var labelSteps: WKInterfaceLabel!
    @IBOutlet weak var labelDistance: WKInterfaceLabel!
    @IBOutlet weak var labelAscended: WKInterfaceLabel!
    @IBOutlet weak var labelDescended: WKInterfaceLabel!
    let pedometer = CMPedometer()
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        super.willActivate()
        
        if (CMPedometer.isPaceAvailable() == true) {
            
            pedometer.startPedometerUpdatesFromDate(NSDate()) { (pedometerData, error) -> Void in
                
                if pedometerData != nil {
                    let steps: UInt = pedometerData!.numberOfSteps.unsignedLongValue
                    self.labelSteps.setText(String(format: "%lu", steps))
                    if pedometerData!.distance != nil {
                        let distance: UInt = pedometerData!.distance!.unsignedLongValue
                        self.labelDistance.setText(String(format: "%lu", distance))
                    }
                    if pedometerData!.floorsAscended != nil {
                        let ascended: UInt = pedometerData!.floorsAscended!.unsignedLongValue
                        self.labelAscended.setText(String(format: "%lu", ascended))
                    }
                    if pedometerData!.floorsDescended != nil {
                        let descended: UInt = pedometerData!.floorsDescended!.unsignedLongValue
                        self.labelDescended.setText(String(format: "%lu", descended))
                    }
                }
            }
        }
        else {
            
            self.labelSteps.setText("not available")
            self.labelDistance.setText("not available")
            self.labelAscended.setText("not available")
            self.labelDescended.setText("not available")
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
        
        pedometer.stopPedometerUpdates()
    }

}
