import Cocoa

class DataViewController: NSViewController {
    @IBOutlet var data: NSTableView!
    @IBOutlet var log: NSTextView!
    
    let dataView = DataView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.dataSource = dataView
    }
    
    func getData() -> [Float] {
        return dataView.getData()
    }
    
    func setLog(_ value: String) {
        log.string = value
    }
}
