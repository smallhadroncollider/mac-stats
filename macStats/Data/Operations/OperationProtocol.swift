import Foundation

protocol OperationProtocol {
    init()
    func arguments(_ data: [Float]) -> [String]
    func parse(_ string: String) -> String
}
