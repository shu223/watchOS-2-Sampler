//
//  InterfaceController.swift
//  watchOS2Sampler WatchKit Extension
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


let kItemKeyTitle       = "title"
let kItemKeyDetail      = "detail"
let kItemKeyClassPrefix = "prefix"


class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var table: WKInterfaceTable!
    var items: [Dictionary<String, String>]!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        items = [
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
                kItemKeyTitle: "Pedometer",
                kItemKeyDetail: "Counting steps demo using CMPedometer.",
                kItemKeyClassPrefix: "Pedometer",
            ],
            [
                kItemKeyTitle: "Heart Rate",
                kItemKeyDetail: "Access to Heart Rate data using HealthKit.",
                kItemKeyClassPrefix: "HeartRate",
            ],
            [
                kItemKeyTitle: "Table Animations",
                kItemKeyDetail: "Insert and remove animations for WKInterfaceTable.",
                kItemKeyClassPrefix: "TableAnimation",
            ],
            [
                kItemKeyTitle: "Animated Props",
                kItemKeyDetail: "Animate width/height and alignments.",
                kItemKeyClassPrefix: "AnimatedProperties",
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
                kItemKeyTitle: "Audio Rec & Play",
                kItemKeyDetail: "Record and play audio.",
                kItemKeyClassPrefix: "AudioRecAndPlay",
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
                kItemKeyTitle: "Alert",
                kItemKeyDetail: "Present an alert or action sheet.",
                kItemKeyClassPrefix: "Alert",
            ],
            [
                kItemKeyTitle: "DigitalCrown-Anim",
                kItemKeyDetail: "Coordinated Animations with WKInterfacePicker and Digital Crown.",
                kItemKeyClassPrefix: "CoordinatedAnimations",
            ],
            [
                kItemKeyTitle: "Interactive Messaging",
                kItemKeyDetail: "Sending message to phone and receiving from phone demo with WatchConnectivity.",
                kItemKeyClassPrefix: "MessageToPhone",
            ],
            [
                kItemKeyTitle: "Open System URL",
                kItemKeyDetail: "Open Tel or SMS app using openSystemURL: method.",
                kItemKeyClassPrefix: "OpenSystemURL",
            ],
            [
                kItemKeyTitle: "Audio File Player",
                kItemKeyDetail: "Play an audio file with WKAudioFilePlayer.",
                kItemKeyClassPrefix: "AudioFilePlayer",
            ],
            [
                kItemKeyTitle: "Network Access",
                kItemKeyDetail: "Get an image data from network using NSURLSession.",
                kItemKeyClassPrefix: "NSURLSession",
            ],
        ]
    }

    override func willActivate() {
        super.willActivate()
        print("willActivate")
        
        self.loadTableData()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }


    // =========================================================================
    // MARK: Private
    
    private func loadTableData() {
        
        table.setNumberOfRows(items.count, withRowType: "Cell")

        var i=0
        for anItem in items {
            let row = table.rowControllerAtIndex(i) as! RowController
            row.showItem(anItem[kItemKeyTitle]!, detail: anItem[kItemKeyDetail]!)
            i++
        }
    }
    
    // =========================================================================
    // MARK: WKInterfaceTable
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        print("didSelectRowAtIndex: \(rowIndex)")
        
        let item = items[rowIndex]
        let title = item[kItemKeyClassPrefix]
        
        self.pushControllerWithName(title!, context: nil)
    }
}
