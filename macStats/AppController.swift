import Cocoa

class AppController: OperationControllerProtocol {
    private let rScript = RScript()
    private var operationsWindowController: NSWindowController?
    
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
        
        operationsWindowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Operations Window Controller")) as? NSWindowController
        showOperations()
        
        if let operationsVC = operationsWindowController?.contentViewController as? OperationsViewController {
            operationsVC.oc = self
            operationsVC.setOperations(rScript.getOperations())
        }
    }
    
    func showOperations() {
        operationsWindowController?.showWindow(nil)
    }
}
