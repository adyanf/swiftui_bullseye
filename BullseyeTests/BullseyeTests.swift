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
        XCTAssertEqual(score, 200)
    }
    
    func testScorePositiveLessThanOrEqual2() {
        let guess = game.target + 1
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 149)
    }
    
    func testScoreNegativeLessThanOrEqual2() {
        let guess = game.target - 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 148)
    }
    
    func testScorePositiveGreaterThan2() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegativeGreaterThan2() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }

    func testAddToLeaderboardAfterStartNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].points, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[0].points, 200)
        XCTAssertEqual(game.leaderboardEntries[1].points, 100)
        game.startNewRound(points: 150)
        XCTAssertEqual(game.leaderboardEntries.count, 3)
        XCTAssertEqual(game.leaderboardEntries[0].points, 200)
        XCTAssertEqual(game.leaderboardEntries[1].points, 150)
        XCTAssertEqual(game.leaderboardEntries[2].points, 100)
    }
}
