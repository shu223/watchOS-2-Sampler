//
//  PedometerInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
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
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }

    override func willActivate() {
        super.willActivate()
        
        if CMPedometer.isPaceAvailable() {
            pedometer.startUpdates(from: Date()) { (pedometerData, error) -> Void in
                
                if let pedometerData = pedometerData {
                    
                    let steps = pedometerData.numberOfSteps.uintValue
                    self.labelSteps.setText(String(format: "%lu", steps))
                    
                    if let distance = pedometerData.distance {
                        self.labelDistance.setText(String(format: "%lu", distance.uintValue))
                    }
                    
                    if let floorsAscended = pedometerData.floorsAscended {
                        self.labelAscended.setText(String(format: "%lu", floorsAscended.uintValue))
                    }
                    
                    if let floorsDescended = pedometerData.floorsDescended {
                        self.labelDescended.setText(String(format: "%lu", floorsDescended.uintValue))
                    }
                }
            }
        }
        else {
            
            labelSteps.setText("not available")
            labelDistance.setText("not available")
            labelAscended.setText("not available")
            labelDescended.setText("not available")
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
        
        pedometer.stopUpdates()
    }

}
