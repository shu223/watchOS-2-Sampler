//
//  AnimatedPropertiesInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class AnimatedPropertiesInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var image: WKInterfaceImage!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
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
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_after(when, queue) { () -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                self.animateWithDuration(0.5, animations: { () -> Void in
                    self.image.setWidth(50)
                    self.image.setHeight(80)
                })
            })
        }
    }

    @IBAction func fadeBtnTapped() {
        
        self.animateWithDuration(0.5) { () -> Void in
            self.image.setAlpha(0.0)
        }
        
        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * double_t(NSEC_PER_SEC)))
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_after(when, queue) { () -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                self.animateWithDuration(0.5, animations: { () -> Void in
                    self.image.setAlpha(1.0)
                })
            })
        }
    }

    @IBAction func moveBtnTapped() {
        
        self.animateWithDuration(0.5) { () -> Void in
            self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Right)
        }
        
        let when1 = dispatch_time(DISPATCH_TIME_NOW, Int64(0.8 * double_t(NSEC_PER_SEC)))
        let queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_after(when1, queue1) { () -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                self.animateWithDuration(0.2) { () -> Void in
                    self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Left)
                }
            })
        }

        let when2 = dispatch_time(DISPATCH_TIME_NOW, Int64(1.2 * double_t(NSEC_PER_SEC)))
        let queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_after(when2, queue2) { () -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                self.animateWithDuration(0.5) { () -> Void in
                    self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Center)
                }
            })
        }
    }
}
