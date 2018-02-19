import Foundation

class Mean: Operation, OperationProtocol {
    func arguments(_ data: [Float]) -> [String] {
        let collection = collect(data)
        
        return [
            "x <- \(collection)",
            "mean(x)",
        ]
    }
}
