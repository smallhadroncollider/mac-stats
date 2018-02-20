//
//  CalculatorProtocol.swift
//  macStats
//
//  Created by Mark Wales on 21/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

import Foundation

protocol CalculatorProtocol {
    func calculate(_ data: [Float], withOperation: String) -> String?
}
