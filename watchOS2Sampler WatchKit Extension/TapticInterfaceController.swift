//
//  TapticInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/11.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class TapticInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var picker: WKInterfacePicker!
    
    var pickerItems: [WKPickerItem]!
    var currentItem: WKPickerItem!
    
    var hapticTypes = [
        "Notification": WKHapticType.Notification,
        "DirectionUp": WKHapticType.DirectionUp,
        "DirectionDown": WKHapticType.DirectionDown,
        "Success": WKHapticType.Success,
        "Failure": WKHapticType.Failure,
        "Retry": WKHapticType.Retry,
        "Start": WKHapticType.Start,
        "Stop": WKHapticType.Stop,
        "Click": WKHapticType.Click,
    ]
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        pickerItems = []
        for typeStr in hapticTypes.keys {
            let pickerItem = WKPickerItem()
            pickerItem.title = typeStr
            pickerItems.append(pickerItem)
        }
        picker.setItems(pickerItems)
        
        currentItem = pickerItems.first
        
        /*
        WKPickerItem *pickerItem1 = [WKPickerItem alloc];
        [pickerItem1 setTitle:@"First item"];
        [pickerItem1 setAccessoryImage:[WKImage imageWithImageName:@"Smile"]];
        
        WKPickerItem *pickerItem2 = [WKPickerItem alloc];
        [pickerItem2 setTitle:@"Second item"];
        [pickerItem2 setAccessoryImage:[WKImage imageWithImageName:@"Smile"]];
        
        WKPickerItem *pickerItem3 = [WKPickerItem alloc];
        [pickerItem3 setTitle:@"Third item"];
        [pickerItem3 setAccessoryImage:[WKImage imageWithImageName:@"Smile"]];
        
        self.pickerItems = [[NSArray alloc] initWithObjects:pickerItem1, pickerItem2, pickerItem3, nil];
        [self.picker setItems:self.pickerItems];
        */
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func pickerItemSelected(index: Int) {
        
        currentItem = pickerItems[index]
    }
    
    @IBAction func hapticBtnTapped() {
        
        let hapticType = hapticTypes[currentItem.title!]
        WKInterfaceDevice.currentDevice().playHaptic(hapticType!)
    }
}
