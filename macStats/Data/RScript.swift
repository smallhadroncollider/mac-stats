//
//  RScript.swift
//  macStats
//
//  Created by Mark Wales on 21/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

import Cocoa

class RScript: NSObject, CalculatorProtocol {
    private let path: String = "/usr/local/bin/Rscript"
    private let operations: [String: (String) -> ([String])] = [
        "Mean": { name in ["mean(\(name))"] },
        "Standard Deviation": { name in ["sd(\(name))"] },
        "Variance": { name in ["y <- \(name)^2", "var(y)"] },
        "Fit": { name in ["y <- \(name)^2", "lm_1 <- lm(y ~ \(name))", "summary(lm_1)"] },
    ]

    func getOperations() -> [String] {
        return operations.keys.sorted()
    }
    
    private func createArguments(operation: String, data: [Float]) -> [String]? {
        let name = "x"
        let collectionArg = data.map(String.init).joined(separator: ",")
        
        if let operationArgs = operations[operation]?(name) {
            let allOperations = ["\(name) <- c(\(collectionArg))"] + operationArgs
            return allOperations.reduce([], { (result, next) in result + ["-e", next] })
        }
        
        return nil
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
    
    func calculate(_ data: [Float], withOperation operation: String) -> String? {
        if let arguments = createArguments(operation: operation, data: data) {
            let task = createTask(arguments: arguments)
            return run(task: task)
        }
        
        return nil
    }
}
