//
//  ViewController.swift
//  macStats
//
//  Created by Mark Wales on 18/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var textView: NSTextView!
    @IBOutlet var calculateButton: NSButton!
    
    let dataView = DataView()
    var model: Document?
    
    var data: [Float] {
        get {
            return dataView.getData()
        }
        set {
            dataView.setData(data: newValue)
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataView
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        let items = dataView.getData()

        if let value = model?.calculate(data: items) {
            textView.string = value
        }
    }
}

