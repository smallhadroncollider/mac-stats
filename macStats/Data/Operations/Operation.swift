import Foundation

class Operation {
    required init() {}
    
    final func collect(_ data: [Float]) -> String {
        let collectionArg = data.map(String.init).joined(separator: ",")
        return "c(\(collectionArg))"
    }
    
    func parse(_ string: String) -> String {
        return string.replacingOccurrences(of: "[1] ", with: "")
    }
}
