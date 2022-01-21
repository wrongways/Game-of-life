//
//  Game_of_lifeTests.swift
//  Game of lifeTests
//
//  Created by jez wain on 1/21/22.
//

import XCTest
@testable import Game_of_life

class Game_of_lifeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Integer mod extension
    func testModZero() throws {
        XCTAssert((0 %% 20) == 0, "Mod zero failed")
    }
    
    func testModEqual() throws {
        XCTAssert((10 %% 10) == 0, "Equal numerator denominator failed")
    }
    
    func testModPositive() throws {
        for numerator in 0...100 {
            for modulus in 1...101 {
                XCTAssert((numerator %% modulus) == (numerator % modulus), "Got a different result with \(numerator)/\(modulus)")
            }
        }
    }

    func testModNegative() throws {
        for numerator in [-3, -5, -7, -11, -13, -17] {
            for modulus in 21...101 {
                XCTAssert((numerator %% modulus) == (numerator % modulus) + modulus,
                          "Got a different result with \(numerator)/\(modulus): \((numerator %% modulus)) != \((numerator % modulus) + modulus)")
            }
        }
    }
    
    

    
    func testGameInit() throws {
        let rows = 10
        let cols = 100
        let game = GameOfLife(size: CGSize(width: cols, height: rows))
        XCTAssert((game._game[0][0] == .dead) || (game._game[0][0] == .alive) , "I'm a zombie")
        XCTAssert(game._game.count == rows, "Wrong number of rows")
        XCTAssert(game._game[0].count == cols, "Wrong number of columns")
        XCTAssert(game.nCols == cols)
        XCTAssert(game.nRows == rows)
    }

    func testPerformanceNeighbourCount() throws {
        // This is an example of a performance test case.
        let game = GameOfLife(size: CGSize(width: 214, height: 14))
        self.measure {
            _ = game.livingNeighboursCounts
        }
    }

}
