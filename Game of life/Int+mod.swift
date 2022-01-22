//
//  Int+mod.swift
//  Game of life
//
//  Created by jez wain on 1/21/22.
//

import Foundation

infix operator %%
extension Int {
    // This is a partial function, doesn't work with -ve modulus
    static func %% (_ lhs: Int, _ rhs: Int) -> Int {
        precondition(rhs > 0, "Modulus must be positive")
        let r = lhs % rhs
        return r >= 0 ? r : r + rhs
    }
}
