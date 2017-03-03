//
//  SeasonTests.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/18/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import LeagueTracker

class SeasonTests: XCTestCase {
    
    func testINITandToDictionary(){
        let team1 = Team(name: "Tigers")
        let team2 = Team(name: "Cats")
        let game = Game(team1: team1, team2: team2, team1Score: 23, team2Score: 34)
        let game1 = Game(team1: team1, team2: team2, team1Score: 33, team2Score: 30)
        let season1 = Season(games: [game, game1])
        let dictionary = season1.toDictionary()
        let season2 = Season(dictionary: dictionary)
        if let season = season2 {
            XCTAssertEqual(season, season1)
        } else {
            XCTAssert(false)
        }
    }
    
    func testSort() {
        let team1 = Team(name: "Tigers")
        let team2 = Team(name: "Cats")
        let team3 = Team(name: "Bugs")
        let team4 = Team(name: "Bats")
        let game = Game(team1: team1, team2: team2, team1Score: 23, team2Score: 34)
        let game1 = Game(team1: team3, team2: team4, team1Score: 2, team2Score: 4)
        let game2 = Game(team1: team3, team2: team4, team1Score: 2, team2Score: 2)
        let season = Season(games: [game, game1, game2])
        let teams = season.sortByRank()
        XCTAssertEqual(teams.count, 4)
        XCTAssertEqual(teams[0], team4)
        XCTAssertEqual(teams[1], team2)
        XCTAssertEqual(teams[2], team3)
        XCTAssertEqual(teams[3], team1)
    }
    
}
