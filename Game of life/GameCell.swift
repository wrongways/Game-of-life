//
//  GameCell.swift
//  Game of life
//
//  Created by jez wain on 1/21/22.
//

import Foundation
enum State {
    case alive
    case dead
}

struct Cell {
    let row: Int
    let col: Int
    var state: State = .dead {
        didSet {
            if state != oldValue {
                let increment = state == .alive ? 1 : -1
                for index in neighbours.indices {
                    neighbours[index].livingNeighboursCount += increment
                }
            }
        }
    }
    var livingNeighboursCount = 0
    var neighbours: [Cell]
}
