//
//  CoordinatedAnimationsInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/12.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class CoordinatedAnimationsInterfaceController: WKInterfaceController {


    @IBOutlet weak var progressGroup: WKInterfaceGroup!
    @IBOutlet weak var picker: WKInterfacePicker!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // create animated images and picker items
        var images: [UIImage]! = []
        var pickerItems: [WKPickerItem]! = []
        for i in 0...36 {
            let name = "progress-\(i)"
            images.append(UIImage(named: name)!)

            let pickerItem = WKPickerItem()
            pickerItem.title = "\(i)"
            pickerItems.append(pickerItem)
        }
        let progressImages = UIImage.animatedImage(with: images, duration: 0.0)
        progressGroup.setBackgroundImage(progressImages)
        picker.setCoordinatedAnimations([progressGroup])
        
        picker.setItems(pickerItems)
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

}
