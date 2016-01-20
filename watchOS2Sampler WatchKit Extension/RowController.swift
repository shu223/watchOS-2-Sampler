//
//  RowController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/10.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit


class RowController: NSObject {

    @IBOutlet weak var textLabel: WKInterfaceLabel!
    @IBOutlet weak var detailLabel: WKInterfaceLabel!
    
    func showItem(title: String, detail: String) {
        
        self.textLabel.setText(title)
        self.detailLabel.setText(detail)
    }
}
