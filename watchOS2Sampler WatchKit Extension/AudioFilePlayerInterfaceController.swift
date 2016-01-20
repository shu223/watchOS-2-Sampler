//
//  AudioFilePlayerInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
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
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
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
