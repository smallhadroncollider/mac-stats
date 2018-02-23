import Cocoa

class Document: NSDocument {
    private var dataVC: DataViewController?
    
    func getData() -> [Float]? {
        return dataVC?.getData()
    }
    
    func setLog(_ value: String) {
        dataVC?.setLog(value)
    }
    
    override func makeWindowControllers() {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
        dataVC = windowController.contentViewController as? DataViewController
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
