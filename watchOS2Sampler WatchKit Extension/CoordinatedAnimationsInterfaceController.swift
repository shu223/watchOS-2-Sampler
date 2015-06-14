//
//  CoordinatedAnimationsInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/12.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class CoordinatedAnimationsInterfaceController: WKInterfaceController {


    @IBOutlet weak var progressGroup: WKInterfaceGroup!
    @IBOutlet weak var picker: WKInterfacePicker!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        // create animated images and picker items
        var images: [UIImage]! = []
        var pickerItems: [WKPickerItem]! = []
        for (var i=0; i<=36; i++) {
            let name = "progress-\(i)"
            images.append(UIImage(named: name)!)

            let pickerItem = WKPickerItem()
            pickerItem.title = "\(i)"
            pickerItems.append(pickerItem)
        }
        let progressImages = UIImage.animatedImageWithImages(images, duration: 0.0)
        progressGroup.setBackgroundImage(progressImages)
        picker.setCoordinatedAnimations([progressGroup])
        
        picker.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
