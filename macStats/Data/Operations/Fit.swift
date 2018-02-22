//
//  Fit.swift
//  macStats
//
//  Created by Mark Wales on 22/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

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
}
