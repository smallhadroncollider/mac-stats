import Foundation

class TTest: Operation, OperationProtocol {
    func arguments(_ data: [Float]) -> [String] {
        let collection = collect(data)
        
        return [
            "x <- \(collection)",
            "t.test(x)",
        ]
    }
    
    override func parse(_ string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

