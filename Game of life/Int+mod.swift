//
//  Int+mod.swift
//  Game of life
//
//  Created by jez wain on 1/21/22.
//

import Foundation

infix operator %%
extension Int {
    static func %% (_ lhs: Int, _ rhs: Int) -> Int {
        precondition(rhs > 0, "Modulus must be positive")
        let r = lhs % rhs
        return r >= 0 ? r : r + rhs
    }
}
