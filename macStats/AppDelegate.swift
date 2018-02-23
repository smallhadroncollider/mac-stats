import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private let appController: AppController = AppController()
    @IBOutlet var showOperations: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        appController.setupPanels()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func showOperationsPanel(sender: Any?) {
        appController.showOperations()
    }
}
