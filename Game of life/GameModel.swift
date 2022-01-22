//
//  GameModel.swift
//  Game of life
//
//  Created by jez wain on 1/21/22.
//

import Foundation

struct GameSize {
    let rows: Int
    let columns: Int
}


struct GameOfLife {
    internal var _game = [[Cell]]()
    internal let size: GameSize
    
    init(size: GameSize) {
        self.size = size
        for rowNum in 0..<size.rows {
            var row = [Cell]()
            for colNum in 0..<size.columns {
                let cellState: State = Int.random(in: 1...10) > 8 ? .alive : .dead
                let newCell = Cell(row: rowNum, col: colNum, state: cellState, neighbours: [Cell]())
                row.append(newCell)
            }
            _game.append(row)
        }
        
        // Initialise the neighbours
        for row in _game {
            for cell in row {
                _game[cell.row][cell.col].neighbours = neighboursFor(cell: cell)
            }
        }
    }
    
    func neighboursFor(cell: Cell) -> [Cell] {
        var neighbours = [Cell]()
        for rowDelta in -1...1 {
            for colDelta in -1...1 {
                if !((rowDelta == 0) && (colDelta == 0)) {
                    let neighbourRow = (cell.row - rowDelta) %% size.rows
                    let neighbourCol = (cell.col - colDelta) %% size.columns
                    neighbours.append(_game[neighbourRow][neighbourCol])
                }
            }
        }
        return neighbours
    }

    func livingNeighboursCountFor(cell: Cell) -> Int {
        (cell.neighbours.filter {$0.state == .alive}).count
    }
    
    mutating func update() {
        for rowNum in 0..<size.rows {
            for colNum in 0..<size.columns {
                let livingNeighbours = livingNeighboursCountFor(cell: _game[rowNum][colNum])
                switch livingNeighbours {
                case 2...3 where _game[rowNum][colNum].state == .alive:
                    continue
                case 3 where _game[rowNum][colNum].state == .dead:
                    _game[rowNum][colNum].state = .alive
                default:
                    _game[rowNum][colNum].state = .dead
                }
            }
        }
    }
}
