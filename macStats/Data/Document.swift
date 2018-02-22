import Cocoa

class Document: NSDocument, CalculatorProtocol {
    private let rScript = RScript()
    
    func calculate(_ data: [Float], withOperation operation: String) -> String? {
        return rScript.calculate(data, withOperation: operation)
    }
    
    private func setupStoryboard() -> NSWindowController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
        return windowController
    }
    
    private func setupViewController(windowController: NSWindowController) {
        let vc = windowController.contentViewController as! ViewController
        vc.calculator = self
        vc.setOperations(rScript.getOperations())
    }

    override func makeWindowControllers() {
        let windowController = setupStoryboard()
        setupViewController(windowController: windowController)
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
