import Cocoa

class AppController: NSObject, OperationControllerProtocol {
    private let rScript = RScript()
    
    func calculate(withOperation operation: String) {
        let document = NSDocumentController.shared.currentDocument as? Document

        if let data = document?.getData(),
           let result = rScript.calculate(data, withOperation: operation)
        {
            document?.setLog(result)
        }
    }
    
    func setupPanels() {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Operations Window Controller")) as! NSWindowController
        windowController.showWindow(nil)
        
        let operationsVC = windowController.contentViewController as? OperationsViewController
        operationsVC?.oc = self
        operationsVC?.setOperations(rScript.getOperations())
    }
}
