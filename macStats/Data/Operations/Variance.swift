import Foundation

class Variance: Operation, OperationProtocol {
    func arguments(_ data: [Float]) -> [String] {
        let collection = collect(data)
        
        return [
            "x <- \(collection)",
            "y <- x^2",
            "var(y)",
        ]
    }
}
