//
//  GameTests.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import LeagueTracker

class GameTests: XCTestCase {
    
    func testINITS(){
        let team1 = Team(name: "Tigers", record: Record(wins: 1, draw: 1, loses: 1))
        let team2 = Team(name: "Raiders", record: Record(wins: 2, draw: 1, loses: 1))
        let game1 = Game(team1: team1, team2: team2, team1Score: 14, team2Score: 7)
        let dictionary: [String: Any] = [
            "team1" : team1.toDictionary(),
            "team2" : team2.toDictionary(),
            "team1Score" : 14,
            "team2Score" : 7
        ]
        let game2 = Game(dictionary: dictionary)
        XCTAssertEqual(game2, game1)
        
    }
    
}
