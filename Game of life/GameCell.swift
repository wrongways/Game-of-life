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
    var neighbours: [Cell]      // has to be var, because set after all cells create
}
