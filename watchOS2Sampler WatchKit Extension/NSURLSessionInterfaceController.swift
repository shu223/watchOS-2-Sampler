//
//  URLSessionInterfaceController.swift
//  watchOS2Sampler
//
//  Created by organlounge on 2015/06/17.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation

class URLSessionInterfaceController: WKInterfaceController {
    
    @IBOutlet var image: WKInterfaceImage!
    
    var task: URLSessionDataTask?
    var isActive: Bool = false
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        isActive = true
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        isActive = false
        if let t = task {
            if t.state == URLSessionTask.State.running {
                t.cancel()
            }
        }
    }

    @IBAction func getImageBtnTapped() {
        let url = URL(string:"https://pbs.twimg.com/profile_images/3186881240/fa714ece16d0fabccf903cec863b1949_400x400.png")!
        let conf = URLSessionConfiguration.default
        let session = URLSession(configuration: conf)
        task = session.dataTask(with: url) { (data, res, error) -> Void in
            if let e = error {
                print("dataTaskWithURL fail: \(e.localizedDescription)")
                return
            }
            if let d = data {
                let image = UIImage(data: d)
                DispatchQueue.main.async(execute: {
                    if self.isActive {
                        self.image.setImage(image)
                    }
                })
            }
        }
        task!.resume()
    }
}
