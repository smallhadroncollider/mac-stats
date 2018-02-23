import Cocoa

class Document: NSDocument {
    private let rScript = RScript()
    private var dataVC: DataViewController?
    private var operationsVC: OperationsViewController?
    
    func calculate(withOperation operation: String) {
        if let data = dataVC?.getData(),
           let result = rScript.calculate(data, withOperation: operation)
        {
            dataVC?.setLog(result)
        }
    }
    
    private func makeWindowController(_ storyboard: NSStoryboard, withID id: String) -> NSWindowController {
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(id)) as! NSWindowController
        self.addWindowController(windowController)
        return windowController
    }
    
    override func makeWindowControllers() {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        
        let documentWC = makeWindowController(storyboard, withID: "Document Window Controller")
        dataVC = documentWC.contentViewController as? DataViewController

        let operationsWC = makeWindowController(storyboard, withID: "Operations Window Controller")
        operationsWC.showWindow(nil)
        
        operationsVC = operationsWC.contentViewController as? OperationsViewController
        operationsVC?.document = self
        operationsVC?.setOperations(rScript.getOperations())
    }
    
    override class var autosavesInPlace: Bool {
        return true
    }

    override func data(ofType typeName: String) throws -> Data {
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
}
