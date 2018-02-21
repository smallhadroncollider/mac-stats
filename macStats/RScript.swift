//
//  RScript.swift
//  macStats
//
//  Created by Mark Wales on 21/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

import Cocoa

class RScript: NSObject {
    private let path: String = "/usr/local/bin/Rscript"
    
    private func createArguments(items: [Float]) -> [String] {
        let data = items.map(String.init).joined(separator: ",")
        return ["-e",  "x <- c(\(data))", "-e", "sd(x)"]
    }
    
    private func createTask(arguments: [String]) -> Process {
        let task: Process = Process()
        task.launchPath = path
        task.arguments = arguments
        return task;
    }
    
    private func readData(pipe: Pipe) -> String? {
        let handle = pipe.fileHandleForReading
        let data = handle.readDataToEndOfFile()
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    private func run(task: Process) -> String? {
        let pipe: Pipe = Pipe()
        task.standardOutput = pipe
        
        do {
            try task.run()
            return readData(pipe: pipe)
        } catch {}
        
        return nil
    }
    
    func calculate(items: [Float]) -> String? {
        let arguments = createArguments(items: items)
        let task = createTask(arguments: arguments)
        return run(task: task);
    }
}
