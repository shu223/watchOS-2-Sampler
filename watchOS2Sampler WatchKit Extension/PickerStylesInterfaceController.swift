//
//  PickerStylesInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/12.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class PickerStylesInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var listPicker: WKInterfacePicker!
    @IBOutlet weak var stackPicker: WKInterfacePicker!
    @IBOutlet weak var sequencePicker: WKInterfacePicker!
    var pickerItems: [WKPickerItem]! = []

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        for (var i=1; i<=10; i++) {
            let pickerItem = WKPickerItem()
            
            let imageName = "m\(i)"
            let image = WKImage(imageName: imageName)
            
            // Text to show when the item is being displayed in a picker with the 'List' style.
            pickerItem.title = imageName
            
            // Caption to show for the item when focus style includes a caption callout.
            pickerItem.caption = imageName
            
            // An accessory image to show next to the title in a picker with the 'List' style. 
            // Note that the image will be scaled and centered to fit within an 13×13pt rect.
            pickerItem.accessoryImage = image
            
            // A custom image to show for the item, used instead of the title + accessory
            // image when more flexibility is needed, or when displaying in the stack or
            // sequence style. The image will be scaled and centered to fit within the
            // picker's bounds or item row bounds.
            pickerItem.contentImage = image

            pickerItems.append(pickerItem)
//            print("\(pickerItems)")
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        listPicker.setItems(pickerItems)
        sequencePicker.setItems(pickerItems)
        stackPicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
