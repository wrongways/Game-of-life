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
                let newCell = Cell(row: rowNum, col: colNum, neighbours: [Cell]())
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
        
        // Initialise the state, and as a repercussion, the living neighbours
        for rowIndex in _game.indices {
            for colIndex in _game[rowIndex].indices {
                if Int.random(in: 1...10) > 8 {
                    _game[rowIndex][colIndex].state = .alive
                }
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
        var nextGame = _game
        for rowNum in 0..<size.rows {
            for colNum in 0..<size.columns {
                let livingNeighbours = _game[rowNum][colNum].livingNeighboursCount
                switch livingNeighbours {
                case 2...3 where _game[rowNum][colNum].state == .alive:
                    continue
                case 3 where _game[rowNum][colNum].state == .dead:
                    nextGame[rowNum][colNum].state = .alive
                default:
                    nextGame[rowNum][colNum].state = .dead
                }
            }
        }
        self._game = nextGame
    }
}
