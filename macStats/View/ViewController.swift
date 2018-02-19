import Cocoa

class ViewController: NSViewController {
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var textView: NSTextView!
    @IBOutlet var calculateButton: NSButton!
    @IBOutlet var operationsMenu: NSPopUpButton!
    
    let dataView = DataView()
    var calculator: CalculatorProtocol?
    
    func setOperations(operations: [String]) {
        operationsMenu.addItems(withTitles: operations)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataView
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        let data = dataView.getData()

        if
            let operation = operationsMenu.selectedItem?.title,
            let value = calculator?.calculate(data, withOperation: operation)
            {
                textView.string = value
            }
    }
}
