//
//  AudioFilePlayerInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class AudioFilePlayerInterfaceController: WKInterfaceController {

    
    @IBOutlet var playBtn: WKInterfaceButton!
    @IBOutlet var label:WKInterfaceLabel!
    
    var player: WKAudioFilePlayer!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let filePath = NSBundle.mainBundle().pathForResource("se_tap", ofType: "m4a")!
        let fileUrl = NSURL.fileURLWithPath(filePath)
        let asset = WKAudioFileAsset(URL: fileUrl)
        let playerItem = WKAudioFilePlayerItem(asset: asset)
        player = WKAudioFilePlayer(playerItem: playerItem)
        
//        playBtn.setEnabled(false)
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
    
    @IBAction func playBtnTapped() {
        
        switch player.status {
        case .ReadyToPlay:
            label.setText("playing")
            player.play()
        case .Failed:
            label.setText("failed")
        case .Unknown:
            label.setText("unknown")
        }
    }
}
