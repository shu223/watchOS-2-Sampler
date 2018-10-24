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
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
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
        
        animate(withDuration: 0.5) { () -> Void in
            self.image.setWidth(100)
            self.image.setHeight(160)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animate(withDuration: 0.5, animations: { () -> Void in
                self.image.setWidth(50)
                self.image.setHeight(80)
            })
        }
    }

    @IBAction func fadeBtnTapped() {
        
        animate(withDuration: 0.5) { () -> Void in
            self.image.setAlpha(0.0)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animate(withDuration: 0.5, animations: { () -> Void in
                self.image.setAlpha(1.0)
            })
        }
    }

    @IBAction func moveBtnTapped() {
        
        animate(withDuration: 0.5) { () -> Void in
            self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.right)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.animate(withDuration: 0.2) { () -> Void in
                self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.left)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.animate(withDuration: 0.5) { () -> Void in
                self.image.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.center)
            }
        }
    }
}
