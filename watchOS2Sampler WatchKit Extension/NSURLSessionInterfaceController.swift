//
//  NSURLSessionInterfaceController.swift
//  watchOS2Sampler
//
//  Created by organlounge on 2015/06/17.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation

class NSURLSessionInterfaceController: WKInterfaceController {
    
    @IBOutlet var image: WKInterfaceImage!
    
    var task: NSURLSessionDataTask?
    var isActive: Bool = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    override func willActivate() {
        super.willActivate()
        self.isActive = true
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        self.isActive = false
        if let t = self.task {
            if t.state == NSURLSessionTaskState.Running {
                t.cancel()
            }
        }
    }

    @IBAction func getImageBtnTapped() {
        let url = NSURL(string:"https://pbs.twimg.com/profile_images/3186881240/fa714ece16d0fabccf903cec863b1949_400x400.png")!
        let conf = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: conf)
        self.task = session.dataTaskWithURL(url) { (data, res, error) -> Void in
            if let e = error {
                print("dataTaskWithURL fail: \(e.debugDescription)")
                return
            }
            if let d = data {
                let image = UIImage(data: d)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if self.isActive {
                        self.image.setImage(image)
                    }
                })
            }
        }
        task!.resume()
    }
}
