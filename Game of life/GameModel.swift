//
//  GameModel.swift
//  Game of life
//
//  Created by jez wain on 1/21/22.
//

import Foundation


struct GameOfLife {
    internal var _game: [[State]]
    internal let nRows: Int
    internal let nCols: Int
    
    init(size: CGSize) {
        nRows = Int(size.height)
        nCols = Int(size.width)
        _game = [[State]](repeating: [State](repeating: .dead, count: nCols), count: nRows)
        for x in 0..<nRows {
            for y in 0..<nCols {
                _game[x][y] = Int.random(in: 1...10) > 8 ? .alive : .dead
            }
        }
    }
    
    private func livingNeighbourCountFor(rowNum: Int, colNum: Int) -> Int {
        var livingNeighbours = 0
        for rowDelta in -1...1 {
            let row = (rowNum + rowDelta) %% nRows
            for colDelta in -1...1 {
                let col = (colNum + colDelta) %% nCols
                if !((rowDelta == 0) && (colDelta == 0)) {
                    // Don't count cell in question
                    if _game[row][col] == .alive {
                        livingNeighbours += 1
                    }
                }
            }
        }
        return livingNeighbours
    }
    
    var livingNeighboursCounts: [[Int]] {
        var livingNeighboursMap = [[Int]](repeating: [Int](repeating: 0, count: nCols), count: nRows)
        for rowNum in 0..<nRows {
            for colNum in 0..<nCols {
                livingNeighboursMap[rowNum][colNum] = livingNeighbourCountFor(rowNum: rowNum, colNum: colNum)
            }
        }
        return livingNeighboursMap
    }
    
    mutating func update() {
        for rowNum in 0..<nRows {
            for colNum in 0..<nCols {
                let livingNeighbours = livingNeighbourCountFor(rowNum: rowNum, colNum: colNum)
                switch livingNeighbours {
                case 2...3 where _game[rowNum][colNum] == .alive:
                    continue
                case 3 where _game[rowNum][colNum] == .dead:
                    _game[rowNum][colNum] = .alive
                default:
                    _game[rowNum][colNum] = .dead
                }
            }
        }
    }
}
