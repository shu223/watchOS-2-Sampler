//
//  GyroscopeInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion


class GyroscopeInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var labelX: WKInterfaceLabel!
    @IBOutlet weak var labelY: WKInterfaceLabel!
    @IBOutlet weak var labelZ: WKInterfaceLabel!
    
    let motionManager = CMMotionManager()

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        motionManager.gyroUpdateInterval = 0.1
    }

    override func willActivate() {
        super.willActivate()

        let handler:CMGyroHandler = {(data: CMGyroData?, error: Error?) -> Void in
            self.labelX.setText(String(format: "%.2f", data!.rotationRate.x))
            self.labelY.setText(String(format: "%.2f", data!.rotationRate.y))
            self.labelZ.setText(String(format: "%.2f", data!.rotationRate.z))
        }
        
        if motionManager.isGyroAvailable {
            motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: handler)
        }
        else {
            labelX.setText("not available")
            labelY.setText("not available")
            labelZ.setText("not available")
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
        
        motionManager.stopGyroUpdates()
    }
}
