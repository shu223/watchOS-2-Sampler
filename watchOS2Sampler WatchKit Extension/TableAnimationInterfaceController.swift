//
//  TableAnimationInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class TableAnimationInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var table: WKInterfaceTable!
    var numberOfRows: Int = 3

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()

        table.setNumberOfRows(numberOfRows, withRowType: "Cell")
        self.loadTableData()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    private func loadTableData() {
        
        for (var i=0; i<numberOfRows; i++) {
            let row = table.rowControllerAtIndex(i) as! RowController
            row.showItem("\(i)", detail: "")
        }
    }

    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func insertBtnTapped() {
        
        table.insertRowsAtIndexes(NSIndexSet(index: 0), withRowType: "Cell")
        numberOfRows++
        self.loadTableData()
    }

    @IBAction func removeBtnTapped() {

        if numberOfRows <= 1 {
            return
        }
        
        table.removeRowsAtIndexes(NSIndexSet(index: 0))
        numberOfRows--
        self.loadTableData()
    }
}
