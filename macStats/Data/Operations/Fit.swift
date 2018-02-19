import Foundation

class Fit: Operation, OperationProtocol {
    func arguments(_ data: [Float]) -> [String] {
        let collection = collect(data)
        
        return [
            "x <- \(collection)",
            "y <- x^2",
            "lm_1 <- lm(y ~ x)",
            "summary(lm_1)",
        ]
    }
    
    override func parse(_ string: String) -> String {
        return string.replacingOccurrences(of: "Call:", with: "")
                     .replacingOccurrences(of: "lm(formula = y ~ x)", with: "")
                     .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
