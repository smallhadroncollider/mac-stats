import Foundation

class RScript: CalculatorProtocol {
    private let path: String = "/usr/local/bin/Rscript"
    private let operations: [String: OperationProtocol.Type] = [
        "Mean": Mean.self,
        "Standard Deviation": StandardDeviation.self,
        "Variance": Variance.self,
        "Fit": Fit.self,
        "T-Test": TTest.self,
    ]

    func getOperations() -> [String] {
        return operations.keys.sorted()
    }
    
    private func createArguments(operation: OperationProtocol, data: [Float]) -> [String]? {
        let arguments = operation.arguments(data)
        return arguments.reduce([]) { (result, next) in result + ["-e", next] }
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
        task.standardError = pipe
        
        do {
            try task.run()
            return readData(pipe: pipe)
        } catch {}
        
        return nil
    }
    
    func calculate(_ data: [Float], withOperation op: String) -> String? {
        if
            let operation = operations[op]?.init(),
            let arguments = createArguments(operation: operation, data: data) {
                let task = createTask(arguments: arguments)
                if let str = run(task: task) {
                    return operation.parse(str)
                }
            }
        
        return nil
    }
}
