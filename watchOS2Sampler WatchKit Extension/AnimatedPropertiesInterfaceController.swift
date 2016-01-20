//
//  AnimatedPropertiesInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class AnimatedPropertiesInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var image: WKInterfaceImage!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func scaleBtnTapped() {
        
        self.animateWithDuration(0.5) { () -> Void in
            self.image.setWidth(100)
            self.image.setHeight(160)
        }

        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * double_t(NSEC_PER_SEC)))
        dispatch_after(when, dispatch_get_main_queue()) { () -> Void in
            self.animateWithDuration(0.5, animations: { () -> Void in
                self.image.setWidth(50)
                self.image.setHeight(80)
            })
        }
    }

    @IBAction func fadeBtnTapped() {
        
        self.animateWithDuration(0.5) { () -> Void in
            self.image.setAlpha(0.0)
        }
        
        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * double_t(NSEC_PER_SEC)))
        dispatch_after(when, dispatch_get_main_queue()) { () -> Void in
            self.animateWithDuration(0.5, animations: { () -> Void in
                self.image.setAlpha(1.0)
            })
        }
    }

    @IBAction func moveBtnTapped() {
        
        self.animateWithDuration(0.5) { () -> Void in
            self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Right)
        }
        
        let when1 = dispatch_time(DISPATCH_TIME_NOW, Int64(0.8 * double_t(NSEC_PER_SEC)))
        dispatch_after(when1, dispatch_get_main_queue()) { () -> Void in
            self.animateWithDuration(0.2) { () -> Void in
                self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Left)
            }
        }

        let when2 = dispatch_time(DISPATCH_TIME_NOW, Int64(1.2 * double_t(NSEC_PER_SEC)))
        dispatch_after(when2, dispatch_get_main_queue()) { () -> Void in
            self.animateWithDuration(0.5) { () -> Void in
                self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Center)
            }
        }
    }
}
