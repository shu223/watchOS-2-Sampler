//
//  AudioRecAndPlayInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class AudioRecAndPlayInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var recLabel: WKInterfaceLabel!
    @IBOutlet weak var playLabel: WKInterfaceLabel!
    
    
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
    // MARK: - Private

    func recFileURL() -> NSURL {
        
        // Must use a shared container
        let fileManager = NSFileManager.defaultManager()
        let container = fileManager.containerURLForSecurityApplicationGroupIdentifier("group.xx.xx") // replace with your own identifier
        let audioFileURL = container!.URLByAppendingPathComponent("rec.m4a")
        
        return audioFileURL
        
        /*
        let filePaths = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask,
            true)
        let documentDir = filePaths.first!
        let filePath = documentDir + "rec.m4a"
        let fileUrl = NSURL.fileURLWithPath(filePath)
        
        return fileUrl
        */
    }
    
    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func recBtnTapped() {

        self.presentAudioRecordingControllerWithOutputURL(
            self.recFileURL(),
            preset: WKAudioRecordingPreset.NarrowBandSpeech,
            maximumDuration: 5.0,
            actionTitle: "SomeTitle") { (didSave, error) -> Void in
                
                self.recLabel.setText("didSave:\(didSave), error:\(error)")
        }
    }
    
    @IBAction func playBtnTapped() {
        
        self.presentMediaPlayerControllerWithURL(
            self.recFileURL(),
            options: nil) { (didPlayToEnd, endTime, error) -> Void in
                
                self.playLabel.setText("didPlayToEnd:\(didPlayToEnd), endTime:\(endTime), error:\(error)")
        }
    }
}
