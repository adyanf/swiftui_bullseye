//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Adya Naufal Fikri on 09/08/22.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePerfect() {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 100)
    }
    
    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}
