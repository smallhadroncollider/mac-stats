import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private let appController: AppController = AppController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        appController.setupPanels()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
