//
//  DrawPathsInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/07/14.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class DrawPathsInterfaceController: WKInterfaceController {
    
    
    @IBOutlet weak var image: WKInterfaceImage!
    
    
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
    // MARK: - Actions
    
    @IBAction func strokeBtnTapped() {
        
        // Create a graphics context
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Setup for the path appearance
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(4.0)

        // Draw lines
        context.beginPath()
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: 100, y: 100))
        context.move(to: CGPoint(x: 0, y: 100))
        context.addLine(to: CGPoint(x: 100, y: 0))
        context.strokePath()
        
        // Convert to UIImage
        let cgimage = context.makeImage()
        let uiimage = UIImage(cgImage: cgimage!)

        // End the graphics context
        UIGraphicsEndImageContext()
        
        image.setImage(uiimage)
    }

    @IBAction func bezierBtnTapped() {

        // Create a graphics context
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Setup for the path appearance
        UIColor.green.setStroke()
        UIColor.white.setFill()
        
        // Draw an oval
        let rect = CGRect(x: 2, y: 2, width: 96, height: 96)
        let path = UIBezierPath(ovalIn: rect)
        path.lineWidth = 4.0
        path.fill()
        path.stroke()
        
        // Convert to UIImage
        let cgimage = context.makeImage()
        let uiimage = UIImage(cgImage: cgimage!)
        
        // End the graphics context
        UIGraphicsEndImageContext()
        
        image.setImage(uiimage)
    }
    
    @IBAction func svgBtnTapped() {

        // Create a graphics context
        let size = CGSize(width: 512, height: 512)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Setup for the path appearance
        UIColor.yellow.setFill()

        // Convert SVG -> CGPath -> UIBezierPath
        let pocketSvg = PocketSVG(fromSVGFileNamed: "sample")!
        let path = pocketSvg.bezier!
        print(path)
        path.fill()
        
        // Convert to UIImage
        let cgimage = context.makeImage()
        let uiimage = UIImage(cgImage: cgimage!)
        
        // End the graphics context
        UIGraphicsEndImageContext()
        
        image.setImage(uiimage)
    }
}
