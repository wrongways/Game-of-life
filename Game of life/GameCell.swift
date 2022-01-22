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
    var state: State = .dead
    var livingNeighbours = 0
    let hostGridSize: GameSize
    
    func isNeighbour(to cell: Cell) -> Bool {
        let neighbourDeltas = [[1, 0], [0, 1], [1, 1],
                               [hostGridSize.rows - 1, 0],
                               [0, hostGridSize.columns - 1],
                               [hostGridSize.rows - 1, hostGridSize.columns - 1]]
        let xDelta = abs(row - cell.row)
        let yDelta = abs(col - cell.col)
        return neighbourDeltas.contains([xDelta, yDelta])
    }
}
