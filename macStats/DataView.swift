//
//  DataView.swift
//  macStats
//
//  Created by Mark Wales on 21/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

import Cocoa

class DataView: NSObject {
    private var items: [Float] = []
    
    func getData() -> [Float] {
        return items
    }
    
    func setData(data: [Float]) {
        items = data
    }
}

extension DataView : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return items.count + 1
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        
        if row < items.count {
            return items[row]
        }
        
        return ""
    }
    
    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        if row >= items.count {
            items.append(0)
            tableView.reloadData()
        }

        if let val = (object as? NSString) {
            items[row] = val.floatValue
        }
    }
}
