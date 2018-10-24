//
//  InterfaceController.swift
//  watchOS2Sampler WatchKit Extension
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


let kItemKeyTitle       = "title"
let kItemKeyDetail      = "detail"
let kItemKeyClassPrefix = "prefix"


class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var table: WKInterfaceTable!
    var items: [Dictionary<String, String>]!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        items = [
            [
                kItemKeyTitle: "Animated Props",
                kItemKeyDetail: "Animate width/height, alpha and alignments.",
                kItemKeyClassPrefix: "AnimatedProperties",
            ],
            [
                kItemKeyTitle: "Table Animations",
                kItemKeyDetail: "Insert and remove animations for WKInterfaceTable.",
                kItemKeyClassPrefix: "TableAnimation",
            ],
            [
                kItemKeyTitle: "Picker Styles",
                kItemKeyDetail: "WKInterfacePicker styles catalog.",
                kItemKeyClassPrefix: "PickerStyles",
            ],
            [
                kItemKeyTitle: "Taptic Engine",
                kItemKeyDetail: "Access to the Taptic engine using playHaptic method.",
                kItemKeyClassPrefix: "Taptic",
            ],
            [
                kItemKeyTitle: "Audio Rec & Play",
                kItemKeyDetail: "Record and play audio.",
                kItemKeyClassPrefix: "AudioRecAndPlay",
            ],
            [
                kItemKeyTitle: "DigitalCrown-Anim",
                kItemKeyDetail: "Coordinated Animations with WKInterfacePicker and Digital Crown.",
                kItemKeyClassPrefix: "CoordinatedAnimations",
            ],
            [
                kItemKeyTitle: "Draw Paths",
                kItemKeyDetail: "Draw paths with Core Graphics.",
                kItemKeyClassPrefix: "DrawPaths",
            ],
            [
                kItemKeyTitle: "Gradations",
                kItemKeyDetail: "Draw gradations with Core Graphics.",
                kItemKeyClassPrefix: "Gradation",
            ],
            [
                kItemKeyTitle: "Heart Rate",
                kItemKeyDetail: "Access to Heart Rate data using HealthKit.",
                kItemKeyClassPrefix: "HeartRate",
            ],
            [
                kItemKeyTitle: "Accelerometer",
                kItemKeyDetail: "Access to Accelerometer data using CoreMotion.",
                kItemKeyClassPrefix: "Accelerometer"
            ],
            [
                kItemKeyTitle: "Gyroscope",
                kItemKeyDetail: "Access to Gyroscope data using CoreMotion.",
                kItemKeyClassPrefix: "Gyroscope",
            ],
            [
                kItemKeyTitle: "Device Motion",
                kItemKeyDetail: "Access to DevicemMotion data using CoreMotion.",
                kItemKeyClassPrefix: "DeviceMotion",
            ],
            [
                kItemKeyTitle: "Pedometer",
                kItemKeyDetail: "Counting steps demo using CMPedometer.",
                kItemKeyClassPrefix: "Pedometer",
            ],
            [
                kItemKeyTitle: "Alert",
                kItemKeyDetail: "Present an alert or action sheet.",
                kItemKeyClassPrefix: "Alert",
            ],
            [
                kItemKeyTitle: "Interactive Messaging",
                kItemKeyDetail: "Sending message to phone and receiving from phone demo with WatchConnectivity.",
                kItemKeyClassPrefix: "MessageToPhone",
            ],
            [
                kItemKeyTitle: "Audio File Player",
                kItemKeyDetail: "Play an audio file with WKAudioFilePlayer.",
                kItemKeyClassPrefix: "AudioFilePlayer",
            ],
            [
                kItemKeyTitle: "Open System URL",
                kItemKeyDetail: "Open Tel or SMS app using openSystemURL: method.",
                kItemKeyClassPrefix: "OpenSystemURL",
            ],
            [
                kItemKeyTitle: "Network Access",
                kItemKeyDetail: "Get an image data from network using URLSession.",
                kItemKeyClassPrefix: "URLSession",
            ],
            [
                kItemKeyTitle: "FPS Test",
                kItemKeyDetail: "Animation FPS Test",
                kItemKeyClassPrefix: "FPSTrial",
            ],
        ]
    }

    override func willActivate() {
        super.willActivate()
        print("willActivate")
        
        loadTableData()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }


    // =========================================================================
    // MARK: Private
    
    private func loadTableData() {
        
        table.setNumberOfRows(items.count, withRowType: "Cell")

        var i=0
        for anItem in items {
            let row = table.rowController(at: i) as! RowController
            row.showItem(title: anItem[kItemKeyTitle]!, detail: anItem[kItemKeyDetail]!)
            i += 1
        }
    }
    
    // =========================================================================
    // MARK: WKInterfaceTable
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        print("didSelectRowAtIndex: \(rowIndex)")
        
        let item = items[rowIndex]
        let title = item[kItemKeyClassPrefix]
        
        pushController(withName: title!, context: nil)
    }
}
