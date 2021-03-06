import Cocoa

class OperationsViewController: NSViewController {
    @IBOutlet var operations: NSTableView!
    @IBOutlet var calculate: NSButton!
    @IBOutlet var search: NSSearchField!
    
    private let operationsView = OperationsView()
    var oc: OperationControllerProtocol?
    
    func setOperations(_ ops: [String]) {
        operationsView.setOperations(ops)
        operations.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operations.dataSource = operationsView
    }
    
    @IBAction func searchChanged(sender: NSSearchField) {
        operationsView.limitTo(sender.stringValue)
        operations.reloadData()
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        if let operation = operationsView.operationFor(row: operations.selectedRow) {
            oc?.calculate(withOperation: operation)
        }
    }
}

