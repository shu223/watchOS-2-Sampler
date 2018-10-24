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

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context) 
    }

    override func willActivate() {
        super.willActivate()

        table.setNumberOfRows(numberOfRows, withRowType: "Cell")
        loadTableData()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    private func loadTableData() {
        
        for i in 0 ..< numberOfRows {
            let row = table.rowController(at: i) as! RowController
            row.showItem(title: "\(i)", detail: "")
        }
    }

    
    // =========================================================================
    // MARK: - Actions
    
    @IBAction func insertBtnTapped() {
        
        table.insertRows(at: IndexSet(arrayLiteral: 0), withRowType: "Cell")
        numberOfRows += 1
        loadTableData()
    }

    @IBAction func removeBtnTapped() {

        if numberOfRows <= 1 {
            return
        }
        
        table.removeRows(at: IndexSet(arrayLiteral: 0))
        numberOfRows -= 1
        loadTableData()
    }
}
