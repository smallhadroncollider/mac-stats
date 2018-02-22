import Cocoa

class ViewController: NSViewController {
    @IBOutlet var dataTable: NSTableView!
    @IBOutlet var operationsTable: NSTableView!
    @IBOutlet var textView: NSTextView!
    @IBOutlet var calculateButton: NSButton!
    @IBOutlet var search: NSSearchField!
    
    let dataView = DataView()
    let operationsView = OperationsView()
    
    var calculator: CalculatorProtocol?
    
    func setOperations(_ operations: [String]) {
        operationsView.setOperations(operations)
        operationsTable.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataTable.dataSource = dataView
        operationsTable.dataSource = operationsView
    }
    
    @IBAction func searchChanged(sender: NSSearchField) {
        operationsView.limitTo(sender.stringValue)
        operationsTable.reloadData()
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        let data = dataView.getData()
        
        if
            let operation = operationsView.operationFor(row: operationsTable.selectedRow),
            let value = calculator?.calculate(data, withOperation: operation)
            {
                textView.string = value
            }
    }
}
