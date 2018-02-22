//
//  Mean.swift
//  macStats
//
//  Created by Mark Wales on 22/02/2018.
//  Copyright © 2018 Mark Wales. All rights reserved.
//

import Foundation

class Operation {
    required init() {}
    
    func collect(_ data: [Float]) -> String {
        let collectionArg = data.map(String.init).joined(separator: ",")
        return "c(\(collectionArg))"
    }
}
