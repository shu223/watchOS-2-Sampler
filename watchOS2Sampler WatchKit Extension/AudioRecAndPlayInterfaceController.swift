//
//  AudioRecAndPlayInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class AudioRecAndPlayInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var recLabel: WKInterfaceLabel!
    @IBOutlet weak var playLabel: WKInterfaceLabel!
    
    
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
    // MARK: - Private

    func recFileURL() -> URL? {
        
        // Must use a shared container
        let fileManager = FileManager.default
        let container = fileManager.containerURL(forSecurityApplicationGroupIdentifier: "group.com.shu223.watchos2sampler") // replace with your own identifier!!!!
        if let container = container {
            return container.appendingPathComponent("rec.mp4")
        }
        else {
            return nil
        }
    }
    
    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func recBtnTapped() {

        if let recFileUrl = recFileURL() {
            
            presentAudioRecorderController(
                withOutputURL: recFileUrl,
                preset: WKAudioRecorderPreset.highQualityAudio,
                options: nil,
                completion:
                { (didSave, error) -> Void in
                    print("error:\(String(describing: error))\n")
                    self.recLabel.setText("didSave:\(didSave), error:\(String(describing: error))")
            })
        }
    }
    
    @IBAction func playBtnTapped() {
        
        if let recFileUrl = recFileURL() {
            
            presentMediaPlayerController(
                with: recFileUrl,
                options: nil) { (didPlayToEnd, endTime, error) -> Void in
                    
                    self.playLabel.setText("didPlayToEnd:\(didPlayToEnd), endTime:\(endTime), error:\(String(describing: error))")
            }
        }
    }
}
