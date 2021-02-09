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
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let filePath = Bundle.main.path(forResource: "se_tap", ofType: "m4a")!
        let fileUrl = URL(fileURLWithPath: filePath)
        let asset = WKAudioFileAsset(url: fileUrl)
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
        case .readyToPlay:
            label.setText("playing")
            player.play()
        case .failed:
            label.setText("failed")
        case .unknown:
            label.setText("unknown")
        @unknown default:
            fatalError()
        }
    }
}
