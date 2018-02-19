import Cocoa

class DataView: NSObject {
    private var data: [Float] = []
    
    func getData() -> [Float] {
        return data
    }
    
    func setData(_ value: [Float]) {
        data = value
    }
}

extension DataView : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count + 1
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return row < data.count ? data[row] : ""
    }
    
    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        if row >= data.count {
            data.append(0)
            tableView.reloadData()
        }

        if let val = (object as? NSString) {
            data[row] = val.floatValue
        }
    }
}
