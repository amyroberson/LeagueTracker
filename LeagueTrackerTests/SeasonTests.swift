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
        let team1 = Team(name: "Tigers", record: Record(wins: 1, draw: 1, loses: 1))
        let team2 = Team(name: "Cats", record: Record(wins: 2, draw: 1, loses: 1))
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
        let team1 = Team(name: "Tigers", record: Record(wins: 1, draw: 1, loses: 1))
        let team2 = Team(name: "Cats", record: Record(wins: 2, draw: 1, loses: 1))
        let team3 = Team(name: "Bugs", record: Record(wins: 6, draw: 1, loses: 1))
        let team4 = Team(name: "Bats", record: Record(wins: 2, draw: 1, loses: 3))
        let game = Game(team1: team1, team2: team2, team1Score: 23, team2Score: 34)
        let game1 = Game(team1: team3, team2: team4, team1Score: 2, team2Score: 4)
        let season = Season(games: [game, game1])
        let teams = season.sortByRank()
        XCTAssertEqual(teams.count, 4)
        XCTAssertEqual(teams[0], team3)
        XCTAssertEqual(teams[1], team2)
        XCTAssertEqual(teams[2], team4)
        XCTAssertEqual(teams[3], team1)
    }
    
}
