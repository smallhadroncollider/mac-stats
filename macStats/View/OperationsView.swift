import Cocoa

class OperationsView: NSObject {
    private var operations: [String] = []
    private var original: [String] = []
    
    func setOperations(_ value: [String]) {
        original = value
        operations = value
    }
    
    func operationFor(row: Int) -> String? {
        return row >= 0 && row < operations.count ? operations[row] : nil
    }
    
    func limitTo(_ value: String) {
        operations = value.isEmpty ? original : original.filter({ s in s.lowercased().contains(value.lowercased()) })
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

