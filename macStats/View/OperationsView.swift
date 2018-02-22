import Cocoa

class OperationsView: NSObject {
    private var operations: [String] = []
    
    func setOperations(_ value: [String]) {
        operations = value
    }
    
    func operationFor(row: Int) -> String? {
        return row >= 0 && row < operations.count ? operations[row] : nil
    }
}

extension OperationsView : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return operations[row]
    }
}

