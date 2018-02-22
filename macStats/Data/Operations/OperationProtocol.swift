//
//  CalculationProtocol.swift
//  macStats
//
//  Created by Mark Wales on 22/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

import Foundation

protocol OperationProtocol {
    init()
    func arguments(_ data: [Float]) -> [String]
}
